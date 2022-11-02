import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal/constants/app_theme_data.dart';
import 'package:personal/routing/app_routing.dart';
import 'package:personal/utils/app_module.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

void main() async {
  serviceLocator.registerModule(AppModule());

  GoRouter router = AppRouting().router;

  runApp(
    ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Personal',
        routerConfig: router,
        theme: AppThemeData.themeData,
      ),
    ),
  );
}
