class Item {
  final String name;
  //Types are signified by integers. 1 = food, 2 = clothing, 3 = toy
  final int type;
  final int healthPoints;
  final double price;
  final String imagePath; 

  Item({
    required this.name,
    required this.type,
    required this.healthPoints,
    required this.price,
    required this.imagePath,
  });
}
