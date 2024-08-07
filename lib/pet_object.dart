class Pet {
  final String name;
  final int growth;
  final int hunger;
  final int age;
  final int happiness;
  final STATUS curstatus;

  Pet({
    required this.name,
    required this.growth,
    required this.hunger,
    required this.age,
    required this.happiness,
    required this.curstatus
  });
}

enum STATUS {great, happy, ok, tired, sick, hungry}