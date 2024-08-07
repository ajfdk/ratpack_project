import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Screen'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Image.asset('assets/todo.png'),
                iconSize: 10,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen2()),
                  );
                }
              ),
              IconButton(
                icon: Image.asset('assets/timer.png'),
                iconSize: 10,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimerScreen()),
                  );
                },
              ),
              IconButton(
                icon: Image.asset('assets/settings.png'),
                iconSize: 10,
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
              IconButton(
                icon: Image.asset('assets/clothes.png'),
                iconSize: 10,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenA()),
                  );
                },
              ),
              IconButton(
                icon: Image.asset('assets/toys.png'),
                iconSize: 10,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenC()),
                  );
                },
              ),
              ],
              ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/food.png'),
                  iconSize: 10,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen1()),
                  );
                },
              ),
                IconButton(
                  icon: Image.asset('assets/shop.png'),
                  iconSize: 10,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScreenB()),
                    );
                  },
                ),
            ],
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
