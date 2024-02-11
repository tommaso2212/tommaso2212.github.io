import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/pages/home/home_page.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/pages/restaurant/restaurant_dish_list_page.dart';
import 'package:personal_website/pages/restaurant/restaurant_menu_page.dart';
import 'package:personal_website/pages/restaurant/restaurant_order_details_page.dart';
import 'package:personal_website/pages/restaurant/restaurant_order_list_page.dart';
import 'package:personal_website/pages/restaurant/restaurant_order_preview_page.dart';
import 'package:personal_website/pages/restaurant/restaurant_page.dart';
import 'package:personal_website/pages/wordle/wordle_page.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static GoRouter routes = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: homeRoute.path,
    routes: [
      homeRoute,
    ],
  );

  static final homeRoute = GoRoute(
    path: '/',
    name: 'Home',
    builder: (context, state) => const HomePage(),
    routes: [
      wordleRoute,
      restaurantRoute,
    ],
  );

  static final wordleRoute = GoRoute(
    path: 'wordle',
    name: 'Wordle',
    builder: (context, state) => const WordlePage(),
  );

  static final restaurantRoute = GoRoute(
    path: 'restaurant',
    name: 'Restaurant',
    builder: (context, state) => const RestaurantPage(),
    routes: [
      restaurantOrderListRoute,
      restaurantMenuRoute,
      restaurantOrderDetailsRoute,
      restaurantDishListPage,
    ],
  );

  static final restaurantOrderListRoute = GoRoute(
    path: 'orders',
    name: 'Orders',
    builder: (context, state) => const RestaurantOrderListPage(),
  );

  static final restaurantMenuRoute = GoRoute(
    path: 'menu',
    name: 'Menu',
    builder: (context, state) => RestaurantMenuPage(
      orderId: state.uri.queryParameters['id'] != null ? int.tryParse(state.uri.queryParameters['id']!) : null,
    ),
    routes: [
      restaurantOrderPreviewRoute,
    ],
  );

  static final restaurantOrderPreviewRoute = GoRoute(
    path: 'preview',
    name: 'Order preview',
    builder: (context, state) => RestaurantOrderPreviewPage(
      order: state.extra as RestaurantOrder,
    ),
  );

  static final restaurantOrderDetailsRoute = GoRoute(
    path: 'details',
    name: 'Order details',
    builder: (context, state) => RestaurantOrderDetailsPage(
      orderId: state.extra as int,
    ),
  );

  static final restaurantDishListPage = GoRoute(
    path: 'dish-list',
    name: 'Dish to do',
    builder: (context, state) => const RestaurantDishListPage(),
  );

  static String getLocation(BuildContext context) => GoRouterState.of(context).path!;

  static String getName(BuildContext context) => GoRouterState.of(context).name!;
}
