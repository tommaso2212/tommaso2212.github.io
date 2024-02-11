import 'package:flutter/material.dart';
import 'package:personal_website/pages/restaurant/components/common/restaurant_card.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class RestaurantOrderDetail extends StatelessWidget {
  const RestaurantOrderDetail({
    required this.order,
    super.key,
  });

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppDimensions.getPagePadding(context).copyWith(
        top: Dimension.small.value,
        bottom: Dimension.medium.value,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RestaurantCard(
              color: Theme.of(context).colorScheme.tertiary,
              child: Text(
                order.status!.label,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
              ),
            ),
            Center(
              child: Text(
                order.id.toString(),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
