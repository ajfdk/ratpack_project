import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';

class Screen2 extends StatefulWidget{
  @override
  _Screen2State createState() => _Screen2State();
}
class _Screen2State extends State<Screen2> {
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
              //var LocalPoints = MyHomePage().points;
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
              //MyHomePage().points-=10;
              setState(() => MyHomePage().points-=10);
           },
        child: Text(MyHomePage().points.toString()),
      ),
      ],
    ),
    ),
    );
  }
}
