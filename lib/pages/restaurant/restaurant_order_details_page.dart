import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/base/app_bar/base_app_bar_path.dart';
import 'package:personal_website/base/scaffold/base_scaffold.dart';
import 'package:personal_website/pages/restaurant/application/restaurant_order_detail_provider.dart';
import 'package:personal_website/pages/restaurant/components/common/restaurant_order_check.dart';
import 'package:personal_website/pages/restaurant/components/common/restaurant_order_info.dart';
import 'package:personal_website/pages/restaurant/components/order_detail/restaurant_order_action.dart';
import 'package:personal_website/pages/restaurant/components/order_detail/restaurant_order_detail.dart';
import 'package:personal_website/service/router/app_router.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class RestaurantOrderDetailsPage extends ConsumerWidget {
  const RestaurantOrderDetailsPage({
    required this.orderId,
    super.key,
  });

  final int orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(orderStateProvider(orderId));
    return BaseScaffold(
      appBarChildren: [
        BaseAppBarPath(
          title: AppRouter.restaurantRoute.name!,
          onTap: () => context.goNamed(AppRouter.restaurantRoute.name!),
        ),
        BaseAppBarPath(
          title: AppRouter.restaurantOrderListRoute.name!,
          onTap: () => context.goNamed(AppRouter.restaurantOrderListRoute.name!),
        ),
        if (order.hasValue)
          BaseAppBarPath(
            title: 'N. ${order.requireValue.id}',
          ),
      ],
      slivers: [
        ...order.maybeMap(
          orElse: () => [
            const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
          data: (data) => [
            RestaurantOrderDetail(order: data.value),
            RestaurantOrderAction(order: data.value),
            SliverPadding(
              padding: AppDimensions.getPagePadding(context),
              sliver: SliverToBoxAdapter(
                child: RestaurantOrderInfo(
                  order: data.value,
                  builder: (context, dishes) => RestaurantOrderCheck(dishes: dishes),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
