class RestaurantDish {
  RestaurantDish({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    this.description,
  });

  final int id;
  final String name;
  final double price;
  final RestaurantDishCategory category;
  final String? description;
}

enum RestaurantDishCategory {
  appetizer('Appetizers'),
  first('First course'),
  second('Second course'),
  side('Side dishes'),
  dessert('Desserts'),
  beverage('Beverages');

  final String title;
  const RestaurantDishCategory(this.title);
}

extension RestaurantDishFormatter on RestaurantDish {
  String priceToEuros() {
    return '${price.toStringAsFixed(2)} €';
  }
}
