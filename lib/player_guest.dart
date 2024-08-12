import 'pet_object.dart';
import 'item_model.dart';
double points = 500;
//Possibly switch to dictionaries, though not built in.
List<FoodItem> privatePantry = [];
final List<ClotheItem> privateWardrobe = [];
final List<ToyItem> privateToyBox = [];

ClotheItem defaultClothes = ClotheItem(
  name: 'DEFAULT',
  clothingType: -1,
  imagePath: 'assets/COCONUT_NULL.jpg',
  description: 'DEVELOPER DEFAULT',
);
//This list will eventually go in the pet object. Temp here for testing.
List<ClotheItem> equippedClothes = [defaultClothes,defaultClothes,defaultClothes,defaultClothes];

Pet playerPet = Pet(
  name: 'Yranib',
  affection: 50,
  energy: 50,
  growth: 0,
  hunger: 50,
  age: 2,
  happiness: 60,
  petType: 1,
  petSprite: 'mogus.png',
  curstatus: STATUS.hungry
);