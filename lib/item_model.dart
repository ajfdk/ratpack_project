class Item {
  final String name;
  final String imagePath;
  final String description;
  double? price;

  Item({
    required this.name,
    required this.imagePath,
    required this.description,
    this.price,
  });
}

class FoodItem extends Item {
  final int? healthPoints;

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

class ClotheItem extends Item {

  ClotheItem({
    required String name,
    required String imagePath,
    required String description,
  }) : super(
    name: name,
    imagePath: imagePath,
    description: description,
  );
}

class ToyItem extends Item {
  final int? durability;

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
  final double price;
  final int? durability;
  final int? healthPoints;
  //type is an arbitrary value, 1 = food, 2 = clothes, 3 = toy
  final int type;

  ShopItem({
    required String name,
    required String imagePath,
    required String description,
    required this.price,
    required this.type,
    this.durability,
    this.healthPoints
  }) : super(
    name: name,
    imagePath: imagePath,
    description: description,
  );
}
