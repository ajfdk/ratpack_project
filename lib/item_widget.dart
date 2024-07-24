import 'package:flutter/material.dart';
import 'dart:io';
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
              Image.asset(item.imagePath),
             /* Image.file(
                File(item.imagePath),
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
              */
              SizedBox(height: 8),
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Health Points: ${item.healthPoints}'),
              Text('Price: \$${item.price.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }
}
