import 'package:flutter/material.dart';
import 'item_model.dart';
import 'item_widget.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final List<Item> items = [
    FoodItem(
      name: 'Pizza',
      healthPoints: 50,
      description: 'Steaming how pepperoni pizza',
      imagePath: 'assets/pizza.png',
    ),
    FoodItem(
      name: 'Hamburger',
      healthPoints: 100,
      description: 'Classic burger with just meat, bread, and cheese',
      imagePath: 'assets/burger.png',
    ),
    FoodItem(
      name: 'Grill Cheese',
      healthPoints: 150,
      description: 'Two slices of bread with melted cheese in the middle',
      imagePath: 'assets/grilledcheese.jpg',
    ),
    FoodItem(
      name: 'Fruit Snacks',
      healthPoints: 200,
      description: 'A pack of fruit flavored gummies',
      imagePath: 'assets/gummy.jpg',
    ),
    FoodItem(
      name: 'French Fries',
      healthPoints: 30,
      description: 'Hot fries fresh out the grease',
      imagePath: 'assets/fries.png',
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
                      items.removeAt(index);
                    });
                    _selectedItems.clear();
                  });
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
