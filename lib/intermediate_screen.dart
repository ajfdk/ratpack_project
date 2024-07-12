import 'package:flutter/material.dart';
import 'screen1.dart';
import 'screen_a.dart';
import 'screen_b.dart';
import 'screen_c.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
