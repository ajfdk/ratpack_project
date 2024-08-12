import 'package:flutter/material.dart';
import 'package:tamagotchi/background.dart';
import 'package:tamagotchi/screen2.dart';
import 'package:tamagotchi/settings_screen.dart';
import 'package:tamagotchi/main.dart';
import 'screen1.dart';
import 'screen_a.dart';
import 'screen_b.dart';
import 'screen_c.dart';
import 'timer.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'pin_screen.dart';

void main() {
  runApp(MyApp());
}

class IntermediateScreen extends StatelessWidget {
  int points = 20000;
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Play Screen'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 75,
                height: 75,
                child: IconButton(
                icon: Image.asset('assets/todo.png'),
                iconSize: 20,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen2()),
                  );
                }
              ),
              ),
              SizedBox(
                width: 75,
                height: 75,
                child: IconButton(
                icon: Image.asset('assets/timer.png'),
                iconSize: 20,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimerScreen()),
                  );
                },
              ),
              ),
              SizedBox(
                width: 75,
                height: 75,
                child: IconButton(
                icon: Image.asset('assets/settings.png'),
                iconSize: 20,
                onPressed: () {
                  bool pinProtectionEnabled = Provider.of<ThemeProvider>(context, listen: false).pinProtectionEnabled;
                  if (pinProtectionEnabled) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PinScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
                  }
                },
              ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Image.asset('assets/kimtten.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: IconButton(
                icon: Image.asset('assets/clothes.png'),
                iconSize: 20,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenA()),
                  );
                },
              ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: IconButton(
                icon: Image.asset('assets/toys.png'),
                iconSize: 20,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenC()),
                  );
                },
              ),
              ),
              ],
              ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: IconButton(
                  icon: Image.asset('assets/food.png'),
                  iconSize: 20,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen1()),
                  );
                },
              ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: IconButton(
                  icon: Image.asset('assets/shop.png'),
                  iconSize: 20,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScreenB()),
                    );
                  },
                ),
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
