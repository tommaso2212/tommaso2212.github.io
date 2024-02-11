import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/pages/restaurant/domain/repository/restaurant_repository.dart';
import 'package:personal_website/service/router/app_router.dart';

class RestaurantOrderPreviewConfirmButton extends ConsumerWidget {
  const RestaurantOrderPreviewConfirmButton({
    required this.order,
    super.key,
  });

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      onPressed: () {
        final repo = ref.read(restaurantRepositoryProvider);
        repo.createOrder(order: order).then(
              (value) => context.goNamed(
                AppRouter.restaurantOrderDetailsRoute.name!,
                extra: value.id,
              ),
            );
      },
      label: const Text('Confirm'),
      icon: const Icon(Icons.shopping_cart_checkout),
    );
  }
}
