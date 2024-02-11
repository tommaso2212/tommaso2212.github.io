import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_dish.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/pages/restaurant/domain/repository/restaurant_repository_impl.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepository>(
  (ref) => RestaurantRepositoryImpl(),
);

abstract class RestaurantRepository {
  Future<List<RestaurantDish>> getDishes({
    RestaurantDishCategory? category,
  });

  Future<RestaurantOrder> createOrder({
    required RestaurantOrder order,
  });

  Future<RestaurantOrder> getOrder({required int? id});

  Future<List<RestaurantOrder>> getOrders({
    RestaurantOrderStatus? status,
  });

  Future<void> updateOrder({
    required int id,
    required RestaurantOrderStatus status,
  });

  Future<void> removeOrder({
    required int id,
  });

  Future<Map<RestaurantDish, int>> getDishToPrepare();
}
