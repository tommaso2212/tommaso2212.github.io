import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_dish.dart';
import 'package:personal_website/pages/restaurant/domain/repository/restaurant_repository.dart';

final dishesListStateProvider =
    StateNotifierProvider.autoDispose<RestaurantDishToDoListProvider, Map<RestaurantDish, int>>((ref) {
  return RestaurantDishToDoListProvider(ref.read(restaurantRepositoryProvider));
});

class RestaurantDishToDoListProvider extends StateNotifier<Map<RestaurantDish, int>> {
  RestaurantDishToDoListProvider(this.repository) : super({}) {
    init();
  }

  final RestaurantRepository repository;

  late Timer _timer;

  Future<void> init() async {
    await fetchData();
    setTimer();
  }

  void setTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) => fetchData());
  }

  Future<void> fetchData() async {
    final response = await repository.getDishToPrepare();
    state = response;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
