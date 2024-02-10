class RestaurantOrder {
  RestaurantOrder.newOrder()
      : id = null,
        dishes = Map.identity(),
        status = null;

  RestaurantOrder({
    required this.id,
    required this.dishes,
    required this.status,
  });

  final int? id;
  final Map<int, int> dishes;
  final RestaurantOrderStatus? status;
}

enum RestaurantOrderStatus {
  toConfirm,
  toDo,
  ready,
  done;
}

extension RestaurantOrderState on RestaurantOrder {
  RestaurantOrder copyWith({Map<int, int>? dishes}) => RestaurantOrder(
        id: id,
        status: status,
        dishes: dishes != null ? Map.from(dishes) : this.dishes,
      );
}
