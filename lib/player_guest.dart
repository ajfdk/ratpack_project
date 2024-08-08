import 'pet_object.dart';
import 'item_model.dart';
double points = 500;
//Possibly switch to dictionaries, though not built in.
final List<FoodItem> privatePantry = [];
final List<ClotheItem> privateWardrobe = [];
final List<ToyItem> privateToyBox = [];

//This list will eventually go in the pet object. Temp here for testing.
List<ClotheItem>? equippedClothes = [];

Pet playerPet = Pet(
name: 'Yranib',
  growth: 0,
  hunger: 50,
  age: 2,
  happiness: 60,
  curstatus: STATUS.ok
);