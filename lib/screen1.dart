import 'package:flutter/material.dart';
import 'dart:io';
import 'item_model.dart';
import 'item_widget.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final List<Item> items = [
    Item(
      name: 'Pizza',
      healthPoints: 50,
      price: 999.0,
      imagePath: 'path/to/image1.png',
    ),
    Item(
      name: 'Hamburger',
      healthPoints: 100,
      price: 999.0,
      imagePath: 'path/to/image2.png',
    ),
    Item(
      name: 'Grill Cheese',
      healthPoints: 150,
      price: 999.0,
      imagePath: 'path/to/image3.png',
    ),
    Item(
      name: 'Fruit Snacks',
      healthPoints: 200,
      price: 999.0,
      imagePath: 'path/to/image4.png',
    ),
    Item(
      name: 'French Frys',
      healthPoints: 30,
      price: 999.0,
      imagePath: 'path/to/image5.png',
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
