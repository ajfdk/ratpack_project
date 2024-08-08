import 'package:flutter/material.dart';
import 'item_model.dart';
import 'item_widget.dart';
import 'player_guest.dart';
class ScreenA extends StatefulWidget {
  @override
 _ScreenAState createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  List<ClotheItem> activeClothes = equippedClothes;
  final List<ClotheItem> items = privateWardrobe;
final Set<int> _selectedItems = {};

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Clothes'),
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
                    int equippedIndicator = 0;
                    int equippedIndex=0;
                    ClotheItem? equippedObject;
                    equippedClothes.forEach((ClotheObject){
                      if (items[index].clothingType == ClotheObject.clothingType) {
                        equippedIndicator += 1;
                        equippedObject = ClotheObject;
                      }
                      else{
                        equippedIndex += 1;
                      }
                    });
                    if(equippedIndicator == 0) {
                      activeClothes.add(items[index]);
                      equippedClothes = activeClothes;
                      items.removeAt(index);
                    }
                    else{
                      items.add(equippedObject!);
                      activeClothes.add(items[index]);
                      activeClothes.removeAt(equippedIndex);
                      items.removeAt(index);
                      equippedClothes?[1] = items[index];
                      equippedClothes = activeClothes;
                    }
                  });
                  //_selectedItems.clear();
                  equippedClothes = activeClothes;
                });
                _selectedItems.clear();
              },
              child: Text('Customize'),
            ),
            ElevatedButton(
              onPressed: () {
                equippedClothes.forEach((item){
                  items.add(item);
                });
                setState((){
                  equippedClothes.clear();
                }
                );
              },
              child: Text('Remove Clothes'),
            ),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    ),
  );
 }
}
