
// Pet class object. Used for clothing, toys, food, and other interactables with the pet object.
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
  //Will be connected to the pet for tasks.
  late DateTime lastTask;
  late List taskList;

  // required variables and values for the pet (also acts as the initial declaration for the pet object variables.).
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


// Planned Statuses for the pet. Currently have no functionality.
enum STATUS {great, happy, ok, tired, sick, hungry,bored,excited, full,}
