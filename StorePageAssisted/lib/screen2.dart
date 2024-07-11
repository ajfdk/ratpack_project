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
        title: Text('Store'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child:Text.rich(
              TextSpan(
                  text: "Points: " + pointsShop.toString()
              )

          )
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8.0),
                child: IconButton(
                  iconSize: 10,
              icon: Image.asset('assets/ShirtS.png'),
            tooltip: "Shwanky Shirt: 10 points",
            onPressed: () {
              //var LocalPoints = MyHomePage().points;
              //Navigator.push(
              //context,
              //MaterialPageRoute(builder: (context) => MyHomePage()),

            //);
              //MyHomePage().points-=10;
              print(pointsShop.toString());
              setState(() => pointsShop -=10);
              //setState(() => pointsText = pointsShop.toString());
              _Screen2State();
           },
            ),


        //child: Image.asset('images/Shirt.png'),
      ),
              Text("Shirt: 10 Pogger Points"),

            Container(
              margin: EdgeInsets.all(8.0),
              child: IconButton(
                iconSize: 10,
                icon: Image.asset('assets/PantS.png'),
                tooltip: "Pretty Pant: 30 points",
                onPressed: () {
                  //var LocalPoints = MyHomePage().points;
                  //Navigator.push(
                  //context,
                  //MaterialPageRoute(builder: (context) => MyHomePage()),

                  //);
                  //MyHomePage().points-=10;
                  print(pointsShop.toString());
                  setState(() => pointsShop -=30);
                  //setState(() => pointsText = pointsShop.toString());
                  _Screen2State();
                },
              ),


              //child: Image.asset('images/Shirt.png'),
            ),
            Text("Pant: 30 Pogger Points"),
          ],
    ),

    ),
    );
  }
}
