import 'package:personal_website/pages/restaurant/domain/model/restaurant_dish.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/pages/restaurant/domain/repository/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  @override
  Future<List<RestaurantDish>> getDishes({
    RestaurantDishCategory? category,
  }) async {
    var response = [..._mockDishes];

    if (category != null) {
      response = response.where((element) => element.category == category).toList();
    }

    return response;
  }

  @override
  Future<void> createOrder({required RestaurantOrder order}) async {
    final id = _mockOrders.length;
    _mockOrders.add(
      RestaurantOrder(
        id: id,
        dishes: order.dishes,
        status: RestaurantOrderStatus.toConfirm,
      ),
    );
  }

  @override
  Future<RestaurantOrder> getOrder({required int? id}) async {
    return _mockOrders.firstWhere(
      (element) => element.id == id,
      orElse: () => RestaurantOrder.newOrder(),
    );
  }

  @override
  Future<List<RestaurantOrder>> getOrders({RestaurantOrderStatus? status}) async {
    var response = List.from(_mockOrders) as List<RestaurantOrder>;

    if (status != null) {
      response = response.where((element) => element.status == status).toList();
    }

    return response;
  }

  final List<RestaurantDish> _mockDishes = [
    RestaurantDish(
      id: 1,
      name: 'Tagliatelle',
      category: RestaurantDishCategory.first,
      price: 8.00,
      description: 'Tagliatelle al ragù di anatra',
    ),
    RestaurantDish(
      id: 2,
      name: 'Gnocchi',
      category: RestaurantDishCategory.first,
      price: 7.00,
      description: 'Gnocchi al ragù di anatra',
    ),
    RestaurantDish(
      id: 3,
      name: 'Bistecca',
      category: RestaurantDishCategory.second,
      price: 7.00,
      description: 'Bistecca di maiale',
    ),
    RestaurantDish(
      id: 4,
      name: 'Patatine fritte',
      category: RestaurantDishCategory.side,
      price: 3.50,
    ),
    RestaurantDish(
      id: 5,
      name: 'Anelli di cipolla',
      category: RestaurantDishCategory.side,
      price: 3.50,
    ),
    RestaurantDish(
      id: 6,
      name: 'Tiramisù',
      category: RestaurantDishCategory.dessert,
      price: 5.00,
    ),
    RestaurantDish(
      id: 7,
      name: 'Coca cola',
      category: RestaurantDishCategory.beverage,
      price: 2.50,
    ),
    RestaurantDish(
      id: 8,
      name: 'Acqua',
      category: RestaurantDishCategory.beverage,
      price: 1.50,
    ),
  ];

  final List<RestaurantOrder> _mockOrders = [
    RestaurantOrder(
      id: 12,
      dishes: {1: 1, 3: 2, 8: 1},
      status: RestaurantOrderStatus.toConfirm,
    ),
  ];
}
