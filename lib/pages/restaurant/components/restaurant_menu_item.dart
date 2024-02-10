import 'package:flutter/material.dart';
import 'package:personal_website/pages/restaurant/components/restaurant_dish_name.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_dish.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class RestaurantMenuItem extends StatelessWidget {
  const RestaurantMenuItem({
    required this.dish,
    required this.onQuantityUpdate,
    required this.quantity,
    super.key,
  });

  final RestaurantDish dish;
  final int quantity;
  final void Function(int) onQuantityUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimension.medium.horizontalPadding.copyWith(
        top: Dimension.small.value,
        bottom: Dimension.small.value,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: AppDimensions.borderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: RestaurantDishName(dish: dish),
          ),
          Dimension.small.horizontalSeparator,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.outlined(
                constraints: const BoxConstraints(),
                onPressed: quantity > 0 ? () => onQuantityUpdate(quantity - 1) : null,
                iconSize: Dimension.small.value,
                icon: const Icon(Icons.remove),
              ),
              Padding(
                padding: Dimension.small.horizontalPadding,
                child: Text(
                  quantity.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              IconButton.outlined(
                constraints: const BoxConstraints(),
                onPressed: () => onQuantityUpdate(quantity + 1),
                iconSize: Dimension.small.value,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
