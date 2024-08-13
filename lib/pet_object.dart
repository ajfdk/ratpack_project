import 'screen2.dart';

void main() {
  Pet basePet = Pet(
      name: "New",
      spritePath: 'assets/images/mogus.png',
      growth: 0,
      hunger: 0,
      age: 0,
      happiness: 0,
      curstatus: STATUS.ok);
}

class Pet {
  final String name;
  final String spritePath;
  final int growth;
  final int hunger;
  final int age;
  final int happiness;
  final STATUS curstatus;
  late List taskList;
  late String shirt;
  late String pants;

  Pet({
    required this.name,
    required this.spritePath,
    required this.growth,
    required this.hunger,
    required this.age,
    required this.happiness,
    required this.curstatus
});
}

enum STATUS {great, happy, ok, tired, sick, hungry}