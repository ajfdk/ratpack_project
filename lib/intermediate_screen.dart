import 'package:flutter/material.dart';
import 'gameScreen.dart';
import 'screen1.dart';
import 'screen_a.dart';
import 'screen_b.dart';
import 'screen_c.dart';
import 'package:flame/game.dart';

class IntermediateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset('assets/intermediate_image.png'), 
            ),
          ),
          // Flex(direction: Axis.horizontal, children: [],)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child:
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => gameScreen()),
                    );
                  },
                  child: const Text('Game Room', textAlign: TextAlign.center,softWrap: true),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenA()),
                  );
                },
                child: Text('Clothes'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenB()),
                  );
                },
                child: Text('Shop'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenC()),
                  );
                },
                child: Text('Toys'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen1()),
                  );
                },
                child: Text('Food Pantry'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
