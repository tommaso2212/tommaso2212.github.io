import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/pages/restaurant/domain/repository/restaurant_repository.dart';

final orderStateProvider = FutureProvider.family<RestaurantOrder, int>((ref, arg) async {
  final repo = ref.read(restaurantRepositoryProvider);
  return repo.getOrder(id: arg);
});
