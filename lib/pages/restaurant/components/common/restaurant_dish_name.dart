import 'package:flutter/material.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_dish.dart';
import 'package:personal_website/utils/double_extensions.dart';

class RestaurantDishName extends StatelessWidget {
  const RestaurantDishName({
    required this.dish,
    this.hidePrice = false,
    super.key,
  });

  final RestaurantDish dish;
  final bool hidePrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dish.name,
          softWrap: true,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        if (dish.description != null)
          Text(
            dish.description!,
            softWrap: true,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        if (!hidePrice) Text(dish.price.toEuros()),
      ],
    );
  }
}
