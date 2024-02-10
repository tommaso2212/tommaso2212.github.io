import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/service/router/app_router.dart';

final homePageGridStateNotifier = StateNotifierProvider<HomePageGridStateNotifier, List<GoRoute>>(
  (ref) => HomePageGridStateNotifier(),
);

class HomePageGridStateNotifier extends StateNotifier<List<GoRoute>> {
  HomePageGridStateNotifier() : super(routes);

  static List<GoRoute> routes = [
    AppRouter.restaurantRoute,
    AppRouter.wordleRoute,
  ];

  void filterRoutes(String? text) {
    if (text == null || text.isEmpty) {
      state = List.of(routes);
    }
    state = routes
        .where(
          (element) => element.name != null
              ? element.name!.toLowerCase().contains(
                    text!.toLowerCase(),
                  )
              : false,
        )
        .toList();
  }
}
