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
  final int? hungerPoints;

  FoodItem({
    required String name,
    required String imagePath,
    required String description,
    required this.hungerPoints,
  }) : super(
    name: name,
    imagePath: imagePath,
    description: description,
  );
}

class ClotheItem extends Item {
  //arbitrary int to represent what segment of the body the clothing applies to,
  //0 = shoes, 1 = pants, 2 = shirt, 3 = hat
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
  int? durability;
  int? toyType;

  ToyItem({
    required String name,
    required String imagePath,
    required String description,
    required this.durability,
    required this.toyType
  }) : super(
    name: name,
    imagePath: imagePath,
    description: description,
  );
}

class ShopItem extends Item {
  final double price;
  final int? durability;
  final int? hungerPoints;
  //type is an arbitrary value, 1 = food, 2 = clothes, 3 = toy
  final int type;
  final int? clothingType;
  final int? toyType;

  ShopItem({
    required String name,
    required String imagePath,
    required String description,
    required this.price,
    required this.type,
    this.clothingType,
    this.durability,
    this.hungerPoints,
    this.toyType
  }) : super(
    name: name,
    imagePath: imagePath,
    description: description,
  );
}
