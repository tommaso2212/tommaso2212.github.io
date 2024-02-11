import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/pages/restaurant/components/common/restaurant_order_info.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/service/router/app_router.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class RestaurantOrderList extends StatelessWidget {
  const RestaurantOrderList({
    required this.orders,
    super.key,
  });

  final List<RestaurantOrder> orders;

  double _getItemWidth(BuildContext context) {
    final gridSize = MediaQuery.of(context).size.width -
        AppDimensions.getPagePadding(context).left -
        AppDimensions.getPagePadding(context).right;
    final gridAxisCount = Device.of(context).on(
      orElse: () => 2,
      onMobile: () => 1,
    );
    final gridRunSpacing = Dimension.large.value * (gridAxisCount - 1);
    final result = (gridSize - gridRunSpacing) / gridAxisCount;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppDimensions.getPagePadding(context),
      sliver: SliverToBoxAdapter(
        child: Wrap(
          runSpacing: Dimension.large.value,
          spacing: Dimension.large.value,
          children: orders
              .map(
                (e) => SizedBox(
                  width: _getItemWidth(context),
                  child: _RestaurantOrderListItem(order: e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _RestaurantOrderListItem extends StatelessWidget {
  const _RestaurantOrderListItem({
    required this.order,
  });

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButtonTheme.of(context).style?.copyWith(
            padding: MaterialStatePropertyAll(Dimension.large.padding),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: AppDimensions.borderRadius,
              ),
            ),
          ),
      onPressed: () => context.goNamed(
        AppRouter.restaurantOrderDetailsRoute.name!,
        extra: order.id,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Dimension.medium.value),
            child: Text(
              (order.id ?? 'N.A').toString(),
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RestaurantOrderInfo(
            order: order,
            builder: (context, dishes) => Column(
              children: dishes.entries
                  .map(
                    (e) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.key.name),
                        Dimension.small.horizontalSeparator,
                        Text('x ${e.value}'),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
