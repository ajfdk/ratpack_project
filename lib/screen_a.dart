import 'package:flutter/material.dart';
import 'package:tamagotchi/background.dart';
import 'item_model.dart';
import 'item_widget.dart';
import 'package:tamagotchi/pet_view.dart';
import 'gameScreen.dart';
import 'item_model.dart';
import 'item_widget.dart';
import 'player_guest.dart';
import 'package:flame/game.dart';
import 'pet_view.dart';
class ScreenA extends StatefulWidget {
  @override
 _ScreenAState createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  List<ClotheItem> activeClothes = equippedClothes;
  final List<ClotheItem> items = privateWardrobe;
final Set<int> _selectedItems = {};

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Clothes'),
    ),
    body: Column(
      children: [
        Center(
          child: Container(
            height: 350,
           // child: Column(
      padding: EdgeInsets.all(20),
      child: GameWidget(
        game: PetView(),
        backgroundBuilder: (context) => Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/grasstiles.png"),
                  fit: BoxFit.cover)),
        ),
      ),
            )
          ),
    //child: GameWidget(
    //game: PetView(),)
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final isSelected = _selectedItems.contains(index);
              return ItemWidget(
                item: items[index],
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _selectedItems.remove(index);
                    } else {
                      _selectedItems.add(index);
                    }
                  });
                },
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedItems.forEach((index) {
                    //print(_selectedItems.length);
                    if(items[index].clothingType == 0){
                      if(activeClothes[0].clothingType == -1) {
                        activeClothes[0] = items[index];
                        items.removeAt(index);
                        if(activeClothes[0].spriteImagePath != "COCONUT_NULL.jpg") {
                          playerPet.petSpriteLegs = playerPet.petSpecies + "/" +
                              activeClothes[0].spriteImagePath!;
                          print("changed");
                          print(activeClothes);
                        }
                      }
                      else{
                        items.add(activeClothes[0]);
                        activeClothes[0] = items[index];
                        items.removeAt(index);
                        if(activeClothes[0].spriteImagePath != "COCONUT_NULL.jpg") {
                          playerPet.petSpriteLegs = playerPet.petSpecies + "/" +
                              activeClothes[0].spriteImagePath!;
                          print("changed");
                          print(activeClothes);
                        }
                      }
                    }
                    else if(items[index].clothingType == 1){
                      if(activeClothes[1].clothingType == -1) {
                        activeClothes[1] = items[index];
                        items.removeAt(index);
                        if(activeClothes[1].spriteImagePath != "COCONUT_NULL.jpg") {
                          playerPet.petSpriteLegs = playerPet.petSpecies + "/" +
                              activeClothes[1].spriteImagePath!;
                          print("changed");
                          print(activeClothes);
                        }
                      }
                      else{
                        items.add(activeClothes[1]);
                        activeClothes[1] = items[index];
                        items.removeAt(index);
                        if(activeClothes[1].spriteImagePath != "COCONUT_NULL.jpg") {
                          playerPet.petSpriteLegs = playerPet.petSpecies + "/" +
                              activeClothes[1].spriteImagePath!;
                          print("changed");
                          print(activeClothes);
                        }
                      }
                    }
                    else if(items[index].clothingType == 2){
                      if(activeClothes[2].clothingType == -1) {
                        activeClothes[2] = items[index];
                        items.removeAt(index);
                        if(activeClothes[2].spriteImagePath != "COCONUT_NULL.jpg") {
                          playerPet.petSpriteHead = playerPet.petSpecies + "/" +
                              activeClothes[2].spriteImagePath!;
                          print("changed");
                          print(activeClothes);
                        }
                      }
                      else{
                        items.add(activeClothes[2]);
                        activeClothes[2] = items[index];
                        items.removeAt(index);
                        if(activeClothes[2].spriteImagePath != "COCONUT_NULL.jpg") {
                          playerPet.petSpriteHead = playerPet.petSpecies + "/" +
                              activeClothes[2].spriteImagePath!;
                          print("changed");
                          print(activeClothes);
                        }
                      }
                    }
                    else if(items[index].clothingType == 3){
                      if(activeClothes[3].clothingType == -1) {
                        activeClothes[3] = items[index];
                        items.removeAt(index);
                        if(activeClothes[3].spriteImagePath != "COCONUT_NULL.jpg") {
                          playerPet.petSpriteLegs = playerPet.petSpecies + "/" +
                              activeClothes[3].spriteImagePath!;
                          print("changed");
                          print(activeClothes);
                        }
                      }
                      else{
                        items.add(activeClothes[3]);
                        activeClothes[3] = items[index];
                        items.removeAt(index);
                        if(activeClothes[3].spriteImagePath != "COCONUT_NULL.jpg") {
                          playerPet.petSpriteLegs = playerPet.petSpecies + "/" +
                              activeClothes[3].spriteImagePath!;
                          print("changed");
                          print(activeClothes);
                        }
                      }
                    }
                    index = 0;
                  });
                  });
                //equippedClothes = activeClothes;
                _selectedItems.clear();
              },
              child: Text('Customize'),
            ),
            ElevatedButton(
              onPressed: () {
                equippedClothes.forEach((item){
                 if(item.clothingType != -1) {
                    items.add(item);

                  }
                });
                setState((){
                  activeClothes[0] = defaultClothes;
                  activeClothes[1] = defaultClothes;
                  activeClothes[2] = defaultClothes;
                  activeClothes[3] = defaultClothes;
                  equippedClothes = activeClothes;
                  playerPet.petSpriteHead = playerPet.petSpecies+"/"+"head.png";
                  playerPet.petSpriteLegs = playerPet.petSpecies+"/"+"legs.png";
                  _selectedItems.clear();
                }

                );
              },
              child: Text('Remove Clothes'),
            ),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    ),
  );
 }
}
