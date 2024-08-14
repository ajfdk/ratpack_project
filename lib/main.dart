import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'intermediate_screen.dart';
import 'screen2.dart';
import 'settings_screen.dart';
import 'theme_provider.dart';
import 'pin_screen.dart';
import 'pet_view.dart';
import 'theme_provider.dart';
//import 'screen2.dart';
//import 'settings_screen.dart';
//import 'pin_screen.dart';
import 'login.dart';

/*void main() {
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(ThemeData.light()),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeProvider.themeData,
            home: IntermediateScreen(),
          );
        },
      ),
    );
  }
}

/*class MyHomePage extends StatelessWidget {
  int points = 20000;
  final game = MyGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IntermediateScreen()),
                );
              },
              child: Text('Play Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen2()),
                );
              },
              child: Text('To-Do List'),
            ),
            ElevatedButton(
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
              child: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
