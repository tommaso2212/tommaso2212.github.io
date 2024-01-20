import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/pages/home/home_page.dart';
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
    ],
  );

  static final wordleRoute = GoRoute(
    path: 'wordle',
    name: 'Wordle',
    builder: (context, state) => const WordlePage(),
  );

  static String getLocation(BuildContext context) => GoRouterState.of(context).path!;

  static String getName(BuildContext context) => GoRouterState.of(context).name!;
}
