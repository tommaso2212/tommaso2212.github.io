import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/pages/restaurant/domain/repository/restaurant_repository.dart';

final orderStatusStateProvider = StateProvider<RestaurantOrderStatus?>((ref) => RestaurantOrderStatus.toConfirm);

final ordersStateProvider = FutureProvider.autoDispose<List<RestaurantOrder>>((ref) {
  final repo = ref.read(restaurantRepositoryProvider);
  final status = ref.watch(orderStatusStateProvider);
  return repo.getOrders(status: status);
});
