import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/base/app_bar/base_app_bar_path.dart';
import 'package:personal_website/base/scaffold/base_scaffold.dart';
import 'package:personal_website/pages/restaurant/application/restaurant_order_provider.dart';
import 'package:personal_website/pages/restaurant/components/menu/restaurant_menu.dart';
import 'package:personal_website/pages/restaurant/components/menu/restaurant_menu_fab.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/pages/restaurant/domain/repository/restaurant_repository.dart';
import 'package:personal_website/service/router/app_router.dart';

final _restaurantOrderProvider = FutureProvider.family.autoDispose<RestaurantOrder, int?>((ref, id) async {
  return ref.read(restaurantRepositoryProvider).getOrder(id: id);
});

class RestaurantMenuPage extends ConsumerWidget {
  const RestaurantMenuPage({
    required this.orderId,
    super.key,
  });

  final int? orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(_restaurantOrderProvider(orderId));
    return order.maybeWhen(
      data: (data) => _RestaurantMenuPage(order: data),
      orElse: () => const CircularProgressIndicator(),
    );
  }
}

class _RestaurantMenuPage extends ConsumerWidget {
  const _RestaurantMenuPage({required this.order, super.key});

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentOrder = ref.watch(restaurantOrderProvider(order));
    return BaseScaffold(
      appBarChildren: [
        BaseAppBarPath(
          title: AppRouter.restaurantRoute.name!,
          onTap: () => context.goNamed(AppRouter.restaurantRoute.name!),
        ),
        BaseAppBarPath(
          title: AppRouter.getName(context),
        ),
        if (order.id != null)
          BaseAppBarPath(
            title: 'N. ${order.id}',
          ),
      ],
      slivers: [
        RestaurantMenu(
          order: order,
        ),
      ],
      floatingActionButton: currentOrder.dishes.isNotEmpty
          ? RestaurantMenuFab(
              order: currentOrder,
            )
          : null,
    );
  }
}
