import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/restaurant/application/restaurant_dish_to_do_provider.dart';
import 'package:personal_website/pages/restaurant/components/common/restaurant_card.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_dish.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class RestaurantDishList extends ConsumerWidget {
  const RestaurantDishList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dishes = ref.watch(dishesListStateProvider);
    return SliverPadding(
      padding: AppDimensions.getPagePadding(context),
      sliver: SliverToBoxAdapter(
        child: Wrap(
          runSpacing: Dimension.large.value,
          spacing: Dimension.large.value,
          children: dishes.entries
              .map<Widget>(
                (e) => _RestaurantDishListItem(
                  dish: e.key,
                  quantity: e.value,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _RestaurantDishListItem extends StatelessWidget {
  const _RestaurantDishListItem({
    required this.dish,
    required this.quantity,
  });

  final RestaurantDish dish;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return RestaurantCard(
      border: Border.all(color: Theme.of(context).colorScheme.tertiary),
      child: Column(
        children: [
          Text(
            dish.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            'x $quantity',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
