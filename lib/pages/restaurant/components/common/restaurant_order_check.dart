import 'package:flutter/material.dart';
import 'package:personal_website/pages/restaurant/components/common/restaurant_card.dart';
import 'package:personal_website/pages/restaurant/components/common/restaurant_dish_name.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_dish.dart';
import 'package:personal_website/theme/app_dimensions.dart';
import 'package:personal_website/utils/double_extensions.dart';

class RestaurantOrderCheck extends StatelessWidget {
  const RestaurantOrderCheck({
    required this.dishes,
    super.key,
  });

  final Map<RestaurantDish, int> dishes;

  double get total => dishes.entries.fold<double>(
        0,
        (previousValue, element) => previousValue + element.value * element.key.price,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final dishEntry = dishes.entries.elementAt(index);
            return _RestaurantOrderCheckItem(
              dish: dishEntry.key,
              count: dishEntry.value,
            );
          },
          separatorBuilder: (context, index) => Dimension.small.verticalSeparator,
          itemCount: dishes.length,
        ),
        const Divider(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: Dimension.medium.padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  total.toEuros(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _RestaurantOrderCheckItem extends StatelessWidget {
  const _RestaurantOrderCheckItem({
    required this.dish,
    required this.count,
  });

  final RestaurantDish dish;
  final int count;

  @override
  Widget build(BuildContext context) {
    return RestaurantCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: RestaurantDishName(
              dish: dish,
              hidePrice: true,
            ),
          ),
          Dimension.small.horizontalSeparator,
          Column(
            children: [
              Text('$count x ${dish.price.toEuros()}'),
              Padding(
                padding: EdgeInsets.only(top: Dimension.small.value),
                child: Text(
                  (count * dish.price).toEuros(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
