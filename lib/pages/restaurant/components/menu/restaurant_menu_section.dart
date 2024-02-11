import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/base/expansion_tile/base_expansion_tile.dart';
import 'package:personal_website/pages/restaurant/application/restaurant_dish_list_provider.dart';
import 'package:personal_website/pages/restaurant/application/restaurant_order_provider.dart';
import 'package:personal_website/pages/restaurant/components/menu/restaurant_menu_item.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_dish.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/theme/app_dimensions.dart';

final _restaurantMenuSectionProvider = FutureProviderFamily<List<RestaurantDish>, RestaurantDishCategory>((ref, arg) {
  final menu = ref.watch(restaurantDishListProvider);
  return menu.maybeMap(
    data: (data) => data.value.where((element) => element.category == arg).toList(),
    orElse: () => [],
  );
});

class RestaurantMenuSection extends ConsumerWidget {
  const RestaurantMenuSection({
    required this.category,
    required this.order,
    super.key,
  });

  final RestaurantDishCategory category;
  final RestaurantOrder order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dishes = ref.watch(_restaurantMenuSectionProvider(category));
    final currentOrder = ref.watch(restaurantOrderProvider(order));
    return dishes.maybeWhen(
      data: (data) => data.isEmpty
          ? const SizedBox.shrink()
          : Padding(
              padding: Dimension.small.verticalPadding,
              child: BaseExpansionTile(
                title: category.title,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => RestaurantMenuItem(
                    dish: data[index],
                    onQuantityUpdate: (p0) => ref.read(restaurantOrderProvider(order).notifier).updateQuantity(
                          dish: data[index],
                          quantity: p0,
                        ),
                    quantity: currentOrder.dishes[data[index].id] ?? 0,
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: data.length,
                ),
              ),
            ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
