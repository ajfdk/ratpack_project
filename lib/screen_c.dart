import 'package:flutter/material.dart';
import 'dart:io';
import 'item_model.dart';
import 'item_widget.dart';

class ScreenC extends StatefulWidget {
  @override
  _ScreenCState createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  final List<Item> items = [
    Item(
      name: 'Ball',
      healthPoints: 50,
      price: 999.0,
      imagePath: 'path/to/image1.png',
    ),
    Item(
      name: 'Legos',
      healthPoints: 9999,
      price: 999.0,
      imagePath: 'path/to/image2.png',
    ),
    Item(
      name: 'Teddy Bear',
      healthPoints: 150,
      price: 999.0,
      imagePath: 'path/to/image3.png',
    ),
    Item(
      name: 'Doll',
      healthPoints: 200,
      price: 999.0,
      imagePath: 'path/to/image4.png',
    )
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
