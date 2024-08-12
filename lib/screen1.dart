import 'package:flutter/material.dart';
import 'dart:io';
import 'item_model.dart';
import 'item_widget.dart';
import 'player_guest.dart';
import 'pet_object.dart';
class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final List<FoodItem> items = privatePantry;

  final Set<int> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantry'),
      ),
      body: Column(
        children: [
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
                      print((playerPet.hunger + items[index].hungerPoints!));
                      if((playerPet.hunger + items[index].hungerPoints!) > 100){
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Text("Oh No! I am too full for all that food!"),
                              content: Ink.image(
                                  image: const AssetImage('assets/Full_Stomach.png')
                              ),
                              actions:[
                                TextButton(
                                  child: Text("OK"),
                                  onPressed:()=> Navigator.pop(context),
                                )
                              ]
                          ),
                        );
                      }
                      else if(playerPet.petType == items[index].foodType){
                        playerPet.hunger += items[index].hungerPoints!;
                        playerPet.happiness += 10;
                        playerPet.affection += 2;
                        if(playerPet.hunger == 100 && playerPet.hunger > 50){
                          playerPet.curstatus = STATUS.full;
                        }
                        else if(playerPet.hunger <= 50 && playerPet.hunger > 25){
                          playerPet.curstatus = STATUS.ok;
                        }
                        else if(playerPet.hunger <= 25){
                          playerPet.curstatus = STATUS.hungry;
                        }
                        items.removeAt(index);
                      }
                      else{
                        playerPet.hunger += items[index].hungerPoints!;
                        playerPet.happiness += 5;
                        playerPet.affection += 1;
                        if(playerPet.hunger == 100 && playerPet.hunger > 50){
                          playerPet.curstatus = STATUS.full;
                        }
                        else if(playerPet.hunger <= 50 && playerPet.hunger > 25){
                          playerPet.curstatus = STATUS.ok;
                        }
                        else if(playerPet.hunger <= 25){
                          playerPet.curstatus = STATUS.hungry;
                        }
                        items.removeAt(index);
                      }
                    });
                    _selectedItems.clear();
                  });
                  privatePantry = items;
                  print(playerPet.hunger);
                },
                child: Text('Feed Pet'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

}

