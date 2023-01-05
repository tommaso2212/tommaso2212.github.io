import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal/constants/app_theme_data.dart';
import 'package:personal/features/login/application/login_provider.dart';
import 'package:personal/routing/app_route.dart';
import 'package:personal/routing/app_routing.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: Personal(),
    ),
  );
}

class Personal extends ConsumerWidget {
  const Personal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var isLogged = ref.watch(loginProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Personal',
      routerConfig: GoRouter(
        initialLocation: AppRoute.home.path,
        routes: AppRouting.routes,
        redirect: (context, state) async {
          if (AppRoute.login.path == state.location || isLogged) {
            return null;
          }
          return AppRoute.login.path;
        },
      ),
      theme: AppThemeData.themeData,
    );
  }
}
