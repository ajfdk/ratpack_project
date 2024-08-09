import 'package:flutter/material.dart';
import 'item_model.dart';
import 'item_widget.dart';
import 'player_guest.dart';
import 'pet_object.dart';
class ScreenC extends StatefulWidget {
  @override
  _ScreenCState createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  final List<ToyItem> items = privateToyBox;

  final Set<int> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toys'),
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
                      if(playerPet.curstatus == STATUS.hungry){
                        showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                        title: Text("Oh No! I am too hungry to play!"),
                        content: Ink.image(
                        image: const AssetImage('assets/hungry.jpg')
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
                      else if(playerPet.curstatus == STATUS.tired){
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Text("Oh No! I am too tired to play!"),
                              content: Ink.image(
                                  image: const AssetImage('assets/tired.jpg')
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
                      else if(playerPet.curstatus == STATUS.bored && playerPet.petType ==items[index].toyType){
                        playerPet.curstatus = STATUS.excited;
                        playerPet.happiness += 150;
                        playerPet.energy -= 25;
                        items[index].durability = items[index].durability!-1;
                      }
                      else if(playerPet.curstatus == STATUS.bored || playerPet.petType == items[index].toyType){
                        playerPet.curstatus = STATUS.excited;
                        playerPet.happiness += 100;
                        playerPet.energy -= 20;
                        items[index].durability = items[index].durability!-1;
                      }
                      else{
                        playerPet.happiness += 50;
                        playerPet.curstatus = STATUS.happy;
                        items[index].durability = items[index].durability!-1;
                      }
                    });
                    print(playerPet.curstatus);
                    print(playerPet.happiness);
                    print(playerPet.energy);
                    _selectedItems.clear();
                  });
                },
                child: Text('Give toy to pet'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
