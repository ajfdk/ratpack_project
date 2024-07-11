import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';

class Screen2 extends StatefulWidget{
  @override
  _Screen2State createState() => _Screen2State();
}
class _Screen2State extends State<Screen2> {
  int pointsShop = MyHomePage().points;
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
            IconButton(
              iconSize: 10,
              icon: Image.asset('assets/ShirtS.png'),
            onPressed: () {
              //var LocalPoints = MyHomePage().points;
              //Navigator.push(
              //context,
              //MaterialPageRoute(builder: (context) => MyHomePage()),

            //);
              //MyHomePage().points-=10;
              print(pointsShop.toString());
              setState(() => pointsShop -=10);
              _Screen2State();
           },
        //child: Image.asset('images/Shirt.png'),
      ),
      ],
    ),
    ),
    );
  }
}
