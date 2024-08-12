import 'package:flutter/material.dart';
import 'dart:io';
import 'item_model.dart';
import 'item_widget.dart';
import 'package:tamagotchi/main.dart';
import 'player_guest.dart';
import 'points_storage.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({super.key, required this.storage});
  // store and retrieve points!
  final PointsStorage storage;

  @override
  _ScreenBState createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  double _points = 0;
  @override
  void initState() {
    super.initState();
    widget.storage.readPoints().then((value) {
      setState(() {
        _points = value;
      });
    });
  }

  double cartCost = 0;

  final List<Item> items = [
    ShopItem(
      name: 'Pants',
      type: 2,
      price: 10,
      imagePath: 'assets/PantS.png',
      description: 'Pants are gloves for your legs.',
    ),
    ShopItem(
      name: 'Tamagotchi',
      type: 3,
      durability: 100,
      price: 200,
      imagePath: 'assets/Tomogatchi.png',
      description: '',
    ),
    ShopItem(
      name: 'Grill Cheese',
      type: 1,
      healthPoints: 150,
      price: 50,
      imagePath: 'assets/grilledcheese.jpg',
      description: '',
    ),
    ShopItem(
      name: 'Gummies',
      type: 1,
      healthPoints: 200,
      price: 100,
      imagePath: 'assets/gummy.jpg',
      description: '',
    ),
    ShopItem(
      name: 'French Fries',
      type: 1,
      healthPoints: 30,
      price: 999,
      imagePath: 'assets/fries.png',
      description: '',
    )
  ];

  final Set<int> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      //issue with purchasing multiple at a time.
                      //items.removeAt(index);
                      //_selectedItems.remove(index);
                      cartCost += ((items[index] as ShopItem).price);
                    });
                    if(_points >= cartCost) {
                      _selectedItems.forEach((item){
                        print((items[item] as ShopItem).type);
                        if((items[item] as ShopItem).type == 1){
                          FoodItem tempFood = FoodItem(
                            name: (items[item] as ShopItem).name,
                            healthPoints: (items[item] as ShopItem).healthPoints,
                            imagePath: (items[item] as ShopItem).imagePath,
                            description: (items[item] as ShopItem).description,
                          );
                          privatePantry.add(tempFood);
                          print(privatePantry);
                        }
                        else if((items[item] as ShopItem).type == 2){
                          ClotheItem tempClothe = ClotheItem(
                              name: (items[item] as ShopItem).name,
                              imagePath: (items[item] as ShopItem).imagePath,
                              description: (items[item] as ShopItem).description,
                          );
                          privateWardrobe.add(tempClothe);
                          print(privateWardrobe);
                        }
                        else if((items[item] as ShopItem).type == 3){
                          ToyItem tempToy = ToyItem(
                            name: (items[item] as ShopItem).name,
                            durability: (items[item] as ShopItem).durability,
                            imagePath: (items[item] as ShopItem).imagePath,
                            description: (items[item] as ShopItem).description,

                          );
                          privateToyBox.add(tempToy);
                          print(privateToyBox);
                        }
                    });
                      _points -= cartCost;
                      var _ = widget.storage.writePoints(_points);
                    }
                    else{
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Oh No!"),
                          content: Ink.image(
                            image: const AssetImage('assets/poor.jpg')
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
                    cartCost=0;
                    _selectedItems.clear();
                    // points are now handled with storage
                    // points = _points;
                  });
                },
                child: Text('Purchase'),
              ),
              Text.rich(
                TextSpan(
                    text: "Points: " + _points.toString()
                )
              )
            ],
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}