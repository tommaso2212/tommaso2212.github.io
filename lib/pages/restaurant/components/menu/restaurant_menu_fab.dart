import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/service/router/app_router.dart';

class RestaurantMenuFab extends StatelessWidget {
  const RestaurantMenuFab({
    required this.order,
    super.key,
  });

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => context.pushNamed(
        AppRouter.restaurantOrderPreviewRoute.name!,
        extra: order,
      ),
      label: const Text('Continue'),
      icon: const Icon(Icons.add_shopping_cart_outlined),
    );
  }
}
