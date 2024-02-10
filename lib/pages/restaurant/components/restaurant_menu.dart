import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/restaurant/components/restaurant_menu_section.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_dish.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class RestaurantMenu extends ConsumerWidget {
  const RestaurantMenu({
    required this.order,
    super.key,
  });

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPadding(
      padding: AppDimensions.getPagePadding(context),
      sliver: SliverList.builder(
        itemCount: RestaurantDishCategory.values.length,
        itemBuilder: (context, index) => RestaurantMenuSection(
          category: RestaurantDishCategory.values[index],
          order: order,
        ),
      ),
    );
  }
}
