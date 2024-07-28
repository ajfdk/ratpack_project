import 'package:flutter/material.dart';
import 'item_model.dart';
import 'item_widget.dart';

class ScreenC extends StatefulWidget {
  @override
  _ScreenCState createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  final List<Item> items = [
    ToyItem(
      name: 'Ball',
      durability: 50,
      description: 'A big red bouncy ball to throw around',
      imagePath: 'assets/ball.png',
    ),
    ToyItem(
      name: 'Legos',
      durability: 9999,
      description: 'Colorful building bricks',
      imagePath: 'assets/lego.png',
    ),
    ToyItem(
      name: 'Teddy Bear',
      durability: 150,
      description: 'A brown cuddly bear',
      imagePath: 'assets/bear.jpg',
    ),
    ToyItem(
      name: 'Toy Car',
      durability: 200,
      description: 'Yellow windup car',
      imagePath: 'assets/toycar.png',
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
