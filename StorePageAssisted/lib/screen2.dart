import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            ElevatedButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
              MyHomePage().points-=10;
              //setState(()MyHomePage().points-=10);
           },
        child: Text(MyHomePage().points.toString()),
      ),
      ],
    ),
    ),
    );
  }
}
