import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/base/app_bar/base_app_bar_path.dart';
import 'package:personal_website/base/scaffold/base_scaffold.dart';
import 'package:personal_website/pages/restaurant/application/restaurant_order_provider.dart';
import 'package:personal_website/pages/restaurant/components/restaurant_menu.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/pages/restaurant/domain/repository/restaurant_repository.dart';
import 'package:personal_website/service/router/app_router.dart';

final _restaurantOrderProvider = FutureProvider.family<RestaurantOrder, int?>((ref, id) async {
  return ref.read(restaurantRepositoryProvider).getOrder(id: id);
});

class RestaurantPage extends ConsumerWidget {
  const RestaurantPage({
    required this.orderId,
    super.key,
  });

  final int? orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(_restaurantOrderProvider(orderId));
    return order.maybeWhen(
      data: (data) => RestaurantOrderPage(order: data),
      orElse: () => const CircularProgressIndicator(),
    );
  }
}

class RestaurantOrderPage extends ConsumerWidget {
  const RestaurantOrderPage({required this.order, super.key});

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentOrder = ref.watch(restaurantOrderProvider(order));
    return BaseScaffold(
      appBarChildren: [
        BaseAppBarPath(
          title: AppRouter.getName(context),
          onTap: () {},
        ),
        if (order.id != null)
          BaseAppBarPath(
            title: 'N. ${order.id}',
            onTap: () {},
          ),
      ],
      slivers: [
        RestaurantMenu(
          order: order,
        ),
      ],
      floatingActionButton: currentOrder.dishes.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('Continue'),
              icon: const Icon(Icons.shopping_cart_outlined),
            )
          : null,
    );
  }
}
