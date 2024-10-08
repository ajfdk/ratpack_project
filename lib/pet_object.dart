class Pet {
  final String name;
  int affection;
  final int growth;
  int energy;
  int hunger;
  final int age;
  int happiness;
  //arbitrary pet type for indicating item compatability
  //values to be determined on pet design.
  final int petType;
  final String petSpecies;
  String petSpriteHead;
  String petSpriteLegs;
  STATUS curstatus;
  late DateTime lastTask;
  late List taskList;

  Pet({
    required this.name,
    required this.affection,
    required this.growth,
    required this.energy,
    required this.hunger,
    required this.age,
    required this.happiness,
    required this.petType,
    required this.petSpecies,
    required this.petSpriteHead,
    required this.petSpriteLegs,
    required this.curstatus
  });
}

enum STATUS {great, happy, ok, tired, sick, hungry,bored,excited, full,}