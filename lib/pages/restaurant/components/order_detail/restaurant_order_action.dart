import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/pages/restaurant/application/restaurant_order_detail_provider.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/pages/restaurant/domain/repository/restaurant_repository.dart';
import 'package:personal_website/service/router/app_router.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class RestaurantOrderAction extends ConsumerWidget {
  const RestaurantOrderAction({
    required this.order,
    super.key,
  });

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPadding(
      padding: AppDimensions.getPagePadding(context).copyWith(
        bottom: Dimension.medium.value,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (order.status == RestaurantOrderStatus.toConfirm)
              _RestaurantOrderAction(
                orderId: order.id!,
                nextStatus: RestaurantOrderStatus.toDo,
              ),
            if (order.status == RestaurantOrderStatus.toDo)
              _RestaurantOrderAction(
                orderId: order.id!,
                nextStatus: RestaurantOrderStatus.ready,
              ),
            if (order.status == RestaurantOrderStatus.ready)
              _RestaurantOrderAction(
                orderId: order.id!,
                nextStatus: RestaurantOrderStatus.done,
              ),
            _RestaurantOrderRemoveAction(orderId: order.id!),
          ],
        ),
      ),
    );
  }
}

class _RestaurantOrderAction extends ConsumerWidget {
  const _RestaurantOrderAction({
    required this.orderId,
    required this.nextStatus,
  });

  final int orderId;
  final RestaurantOrderStatus nextStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: Dimension.medium.verticalPadding,
      child: FilledButton(
        style: FilledButtonTheme.of(context).style?.copyWith(
              padding: MaterialStatePropertyAll(Dimension.medium.padding),
            ),
        onPressed: () => ref
            .read(restaurantRepositoryProvider)
            .updateOrder(
              id: orderId,
              status: nextStatus,
            )
            .then(
              (value) => ref.refresh(orderStateProvider(orderId)),
            ),
        child: Text(
          nextStatus.label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}

class _RestaurantOrderRemoveAction extends ConsumerWidget {
  const _RestaurantOrderRemoveAction({
    required this.orderId,
  });

  final int orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      style: FilledButtonTheme.of(context).style?.copyWith(
            backgroundColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.error,
            ),
            padding: MaterialStatePropertyAll(Dimension.medium.padding),
          ),
      onPressed: () => ref
          .read(restaurantRepositoryProvider)
          .removeOrder(
            id: orderId,
          )
          .then(
            (value) => context.goNamed(AppRouter.restaurantOrderListRoute.name!),
          ),
      child: Text(
        'Delete order',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onError,
            ),
      ),
    );
  }
}
