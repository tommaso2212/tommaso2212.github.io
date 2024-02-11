import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/base/app_bar/base_app_bar_path.dart';
import 'package:personal_website/base/scaffold/base_scaffold.dart';
import 'package:personal_website/pages/restaurant/application/restaurant_order_list_provider.dart';
import 'package:personal_website/pages/restaurant/components/order_list/restaurant_order_filter.dart';
import 'package:personal_website/pages/restaurant/components/order_list/restaurant_order_list.dart';
import 'package:personal_website/service/router/app_router.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class RestaurantOrderListPage extends ConsumerWidget {
  const RestaurantOrderListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersStateProvider);
    return BaseScaffold(
      appBarChildren: [
        BaseAppBarPath(
          title: AppRouter.restaurantRoute.name!,
          onTap: () => context.goNamed(AppRouter.restaurantRoute.name!),
        ),
        BaseAppBarPath(
          title: AppRouter.getName(context),
        ),
      ],
      slivers: [
        SliverPadding(
          padding: AppDimensions.getPagePadding(context),
          sliver: const SliverToBoxAdapter(
            child: RestaurantOrderFilter(),
          ),
        ),
        orders.maybeMap(
          orElse: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
          data: (data) => RestaurantOrderList(orders: data.value),
        ),
      ],
    );
  }
}
