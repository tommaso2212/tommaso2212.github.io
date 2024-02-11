import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_dish.dart';
import 'package:personal_website/pages/restaurant/domain/repository/restaurant_repository.dart';

final restaurantDishListProvider = FutureProvider<List<RestaurantDish>>((ref) {
  final repo = ref.read(restaurantRepositoryProvider);
  return repo.getDishes();
});
