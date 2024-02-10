import 'package:flutter/material.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_dish.dart';

class RestaurantDishName extends StatelessWidget {
  const RestaurantDishName({
    required this.dish,
    super.key,
  });

  final RestaurantDish dish;

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
        Text(dish.priceToEuros()),
      ],
    );
  }
}
