import 'package:flutter/material.dart';
import 'dart:io';
import 'item_model.dart';
import 'item_widget.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final List<Item> items = [
    Item(
      name: 'Pizza Pillow',
      healthPoints: 50,
      price: 999.0,
      imagePath: 'path/to/image1.png',
    ),
    Item(
      name: 'Battle Axe',
      healthPoints: 100,
      price: 999.0,
      imagePath: 'path/to/image2.png',
    ),
    Item(
      name: 'Pig Mask',
      healthPoints: 150,
      price: 999.0,
      imagePath: 'path/to/image3.png',
    ),
    Item(
      name: 'Plastic Juice Pouch',
      healthPoints: 200,
      price: 999.0,
      imagePath: 'path/to/image4.png',
    ),
    Item(
      name: 'Fruit Gummies',
      healthPoints: 30,
      price: 999.0,
      imagePath: 'path/to/image5.png',
    ),
    Item(
      name: 'Chicken Nuggets Plush',
      healthPoints: 250,
      price: 999.0,
      imagePath: 'path/to/image6.png',
    ),
    Item(
      name: 'Tomogatchi',
      healthPoints: 10,
      price: 999.0,
      imagePath: 'path/to/image7.png',
    ),
    Item(
      name: 'Apple Ball',
      healthPoints: 15,
      price: 999.0,
      imagePath: 'path/to/image8.png',
    ),
  ];

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
                      items.removeAt(index);
                    });
                    _selectedItems.clear();
                  });
                },
                child: Text('Throw at Pet'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
