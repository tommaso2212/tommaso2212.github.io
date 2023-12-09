import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/pages/wordle/wordle_page.dart';

class AppRouter {
  static GoRouter routes = GoRouter(
    initialLocation: wordleRoute.path,
    routes: [
      wordleRoute,
    ],
  );

  static final wordleRoute = GoRoute(
    path: '/wordle',
    name: 'Wordle',
    builder: (context, state) => const WordlePage(),
  );

  static String getLocation(BuildContext context) => GoRouterState.of(context).path!;

  static String getName(BuildContext context) => GoRouterState.of(context).name!;
}
