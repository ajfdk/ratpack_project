class Item {
  final String name;
  final int healthPoints;
  final double price;
  final String imagePath; // Changed from imageUrl

  Item({
    required this.name,
    required this.healthPoints,
    required this.price,
    required this.imagePath,
  });
}
