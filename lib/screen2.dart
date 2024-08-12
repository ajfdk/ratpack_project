import 'package:flutter/material.dart';
import 'package:tamagotchi/background.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('To-Do List'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
      body: Center(
        child: Text('Place To-do List here'),
      ),
    ),
    );
  }
}
