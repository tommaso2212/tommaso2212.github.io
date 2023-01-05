import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal/features/home/presentation/home_screen.dart';
import 'package:personal/features/login/presentation/login_screen.dart';
import 'package:personal/routing/app_route.dart';

class AppRouting {

  static final routes = [
    GoRoute(
      path: AppRoute.login.path,
      name: AppRoute.login.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            child,
      ),
    ),
    GoRoute(
      path: AppRoute.home.path,
      name: AppRoute.home.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            child,
      ),
    ),
  ];

  static void go(BuildContext context, AppRoute route) {
    context.go(route.path);
  }

  static void replace(BuildContext context, AppRoute route) {
    context.pushReplacement(route.path);
  }
}
