class Item {
  final String name;
  final String imagePath;
  final String description;

  Item({
    required this.name,
    required this.imagePath,
    required this.description,
  });
}

class FoodItem extends Item {
  final int healthPoints;

  FoodItem({
    required String name,
    required String imagePath,
    required String description,
    required this.healthPoints,
  }) : super(
    name: name,
    imagePath: imagePath,
    description: description,
  );
}

class ToyItem extends Item {
  final int durability;

  ToyItem({
    required String name,
    required String imagePath,
    required String description,
    required this.durability,
  }) : super(
    name: name,
    imagePath: imagePath,
    description: description,
  );
}

class ShopItem extends Item {
  final int price;

  ShopItem({
    required String name,
    required String imagePath,
    required String description,
    required this.price,
  }) : super(
    name: name,
    imagePath: imagePath,
    description: description,
  );
}
