class Pet {
  final String name;
  final int affection;
  final int growth;
  int hunger;
  final int age;
  final int happiness;
  final STATUS curstatus;

  Pet({
    required this.name,
    required this.affection,
    required this.growth,
    required this.hunger,
    required this.age,
    required this.happiness,
    required this.curstatus
  });
}

enum STATUS {great, happy, ok, tired, sick, hungry}