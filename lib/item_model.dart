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
  //arbitrary int to represent what segment of the body the clothing applies to,
  //1 = shoes, 2 = pants, 3 = shirt, 4 = hat
  final int? clothingType;
  ClotheItem({
    required String name,
    required String imagePath,
    required String description,
    required this.clothingType,
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
  final int? clothingType;

  ShopItem({
    required String name,
    required String imagePath,
    required String description,
    required this.price,
    required this.type,
    this.clothingType,
    this.durability,
    this.healthPoints
  }) : super(
    name: name,
    imagePath: imagePath,
    description: description,
  );
}
