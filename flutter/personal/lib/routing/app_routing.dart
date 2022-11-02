import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal/features/firestore/application/firebase_manager.dart';
import 'package:personal/routing/app_route.dart';
import 'package:personal/utils/service_locator/service_locator.dart';
import 'package:personal/features/home/presentation/home_page.dart';
import 'package:personal/features/users/presentation/login_screen.dart';

class AppRouting {
  final _routes = [
    GoRoute(
      path: AppRoute.login.toPath(),
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
      path: AppRoute.home.toPath(),
      name: AppRoute.home.name,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: const HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            child,
      ),
    ),
  ];

  GoRouter get router => GoRouter(
        initialLocation: AppRoute.home.toPath(),
        routes: _routes,
        redirect: (context, state) async {
          if (AppRoute.login.toPath() == state.location ||
              await serviceLocator<FirebaseManager>().isInitialized()) {
            return null;
          }
          return AppRoute.login.toPath();
        },
      );

  static void go(BuildContext context, AppRoute route) {
    context.go(route.toPath());
  }

  static void replace(BuildContext context, AppRoute route) {
    context.replace(route.toPath());
  }
}
