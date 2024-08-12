import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamagotchi/points_storage.dart';
import 'intermediate_screen.dart';
import 'screen2.dart';
import 'settings_screen.dart';
import 'theme_provider.dart';
import 'pin_screen.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // get saved preferences from shared_preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkTheme = prefs.getBool("theme") ?? false;

  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(isDarkTheme),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: themeProvider.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // int points = 20000;
  final game = MyGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
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
              child: const Text('Play Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen2()),
                );
              },
              child: const Text('To-Do List'),
            ),
            ElevatedButton(
              onPressed: () {
                bool pinProtectionEnabled =
                    Provider.of<ThemeProvider>(context, listen: false)
                        .pinProtectionEnabled;
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
              child: const Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyGame {}
