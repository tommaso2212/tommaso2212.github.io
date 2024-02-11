class RestaurantOrder {
  RestaurantOrder.newOrder()
      : id = null,
        dishes = Map.identity(),
        status = null,
        creationDate = null;

  RestaurantOrder({
    required this.id,
    required this.dishes,
    required this.status,
    required this.creationDate,
  });

  final int? id;
  final Map<int, int> dishes;
  final RestaurantOrderStatus? status;
  final DateTime? creationDate;
}

enum RestaurantOrderStatus {
  toConfirm('To confirm'),
  toDo('To do'),
  ready('Ready'),
  done('Done');

  const RestaurantOrderStatus(this.label);
  final String label;
}

extension RestaurantOrderState on RestaurantOrder {
  RestaurantOrder copyWith({
    Map<int, int>? dishes,
    RestaurantOrderStatus? status,
  }) =>
      RestaurantOrder(
        id: id,
        status: status ?? this.status,
        dishes: dishes != null ? Map.from(dishes) : this.dishes,
        creationDate: creationDate,
      );
}
