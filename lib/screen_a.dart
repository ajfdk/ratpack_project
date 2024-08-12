import 'package:flutter/material.dart';
import 'package:tamagotchi/background.dart';
import 'item_model.dart';
import 'item_widget.dart';

class ScreenA extends StatefulWidget {
  @override
 _ScreenAState createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  final List<Item> items = [
    Item(
      name: 'Sun Hat',
      description: 'Yellow sunhat with a red ribbon',
      imagePath: 'assets/hat.png'
    ),
    Item(
        name: 'Mario Hat',
        description: 'Mario brother\'s famous red hat',
        imagePath: 'assets/mario.png'
    ),
    Item(
        name: 'Orange Jacket',
        description: 'Plain orange hoodie',
        imagePath: 'assets/hoodie.jpg'
    ),
    Item(
        name: 'Dress',
        description: 'Pink frilly dress',
        imagePath: 'assets/dress.png'
    ),
  ];

final Set<int> _selectedItems = {};
//final Set<int> _inUseItems = {};

@override
Widget build(BuildContext context) {
  return BackgroundContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Clothes'),
          backgroundColor: Colors.transparent,
          elevation: 0,
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
              //final isInUse = _inUseItems.contains(index);
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
              child: Text('Customize'),
            ),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    ),
  ),
  );
 }
}
