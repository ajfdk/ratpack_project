import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:tamagotchi/main.dart';

class PetRoomGame extends FlameGame{
  @override
  Future<void> onLoad() async {
    super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    //render here
    canvas.drawRect(
      Rect.fromLTWH(50, 50, 100, 100),
      Paint()..color = Colors.lime,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    // update stuff here
  }
}

class gameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Pet's Room"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GameWidget(
          game: PetRoomGame(),
        ),
      ),
    );
  }
}
