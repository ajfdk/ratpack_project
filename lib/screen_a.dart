import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothes'),
      ),
      body: Center(
        child: Text('Add clothes here'),
      ),
    );
  }
}
