import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_dish.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';

final restaurantOrderProvider =
    StateNotifierProvider.family<RestaurantOrderStateNotifier, RestaurantOrder, RestaurantOrder>((ref, arg) {
  return RestaurantOrderStateNotifier(arg);
});

class RestaurantOrderStateNotifier extends StateNotifier<RestaurantOrder> {
  RestaurantOrderStateNotifier(super.state);

  void updateQuantity({required RestaurantDish dish, required int quantity}) {
    if (quantity == 0) {
      state.dishes.remove(dish.id);
    } else {
      state.dishes.update(dish.id, (value) => quantity, ifAbsent: () => quantity);
    }

    state = state.copyWith(dishes: state.dishes);
  }
}
