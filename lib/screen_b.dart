import 'package:flutter/material.dart';
import 'dart:io';
import 'item_model.dart';
import 'item_widget.dart';
import 'package:tamagotchi/main.dart';
import 'player_guest.dart';
class ScreenB extends StatefulWidget {
  @override
  _ScreenBState createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  double cartCost = 0;
  double pointsShop = points;
  final List<Item> items = [
    Item(
      name: 'Pants',
      type: 2,
      healthPoints: 50,
      price: 10.0,
      imagePath: 'assets/PantS.png',
    ),
    Item(
      name: 'Hamburger',
      type: 1,
      healthPoints: 100,
      price: 900.0,
      imagePath: 'assets/PantS.png',
    ),
    Item(
      name: 'Grill Cheese',
      type: 1,
      healthPoints: 150,
      price: 50.0,
      imagePath: 'assets/PantS.png',
    ),
    Item(
      name: 'Fruit Snacks',
      type: 1,
      healthPoints: 200,
      price: 100.0,
      imagePath: 'assets/PantS.png',
    ),
    Item(
      name: 'French Frys',
      type: 1,
      healthPoints: 30,
      price: 200.0,
      imagePath: 'assets/PantS.png',
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
                      //items.removeAt(index);  //issue with purchasing multiple at a time.
                      //_selectedItems.remove(index);
                      cartCost += items[index].price;
                    });
                    if(pointsShop >= cartCost) {
                      _selectedItems.forEach((item){
                        print(items[item].type);
                    });
                      pointsShop -= cartCost;
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
                    points = pointsShop;
                  });
                },
                child: Text('Purchase'),
              ),
              Text.rich(
                TextSpan(
                    text: "Points: " + pointsShop.toString()
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