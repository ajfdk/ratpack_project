import 'package:flutter/material.dart';
import 'item_model.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  final bool isSelected;
  final VoidCallback onTap;

  ItemWidget({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isSelected ? Colors.blue[100] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  item.imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Flexible(
                child: Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (item is ShopItem) ...[
                SizedBox(height: 4),
                Flexible(
                  child: Text('Price: ${(item as ShopItem).price}'),
                ),
              ],
              SizedBox(height: 4),
              Flexible(
                child: Text(item.description),
              ),
              if (item is FoodItem) ...[
                SizedBox(height: 4),
                Flexible(
                  child: Text('Health Points: ${(item as FoodItem).healthPoints}'),
                ),
              ],
              if (item is ToyItem) ...[
                SizedBox(height: 4),
                Flexible(
                  child: Text('Durability: ${(item as ToyItem).durability}'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
