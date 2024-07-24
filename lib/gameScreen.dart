import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:tamagotchi/main.dart';
import 'package:flame/input.dart';

class PetRoomGame extends FlameGame with HasCollisionDetection, HasGameRef{
  late IdleSprite pet_mob;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // final petImage = await images.load('mogus.png');
    // pet_mob = Sprite(petImage);
    add(ScreenHitbox());
    pet_mob = IdleSprite()
      ..position = Vector2(100, 100)
      ..size = Vector2(50, 50);
    add(pet_mob);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    //render here
    // pet_mob.render(canvas, position: Vector2(50, 50));

    // canvas.drawRect(
    //   Rect.fromLTWH(50, 50, 100, 100),
    //   Paint()..color = Colors.red,
    // );
  }

  @override
  void update(double dt) {
    super.update(dt);
    // update stuff here
  }
}

class IdleSprite extends SpriteComponent with CollisionCallbacks {
  static const double speed = 100;
  Vector2 direction = Vector2.zero();
  bool isMoving = false;
  double timeToChangeDirection = 2.0;
  double timePassed = 0.0;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load('mogus.png');
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    timePassed += dt;
    if (timePassed >= timeToChangeDirection) {
      timePassed = 0;
      isMoving = !isMoving;
      if (isMoving) {
        direction = (Vector2.random() - Vector2(0.5, 0.5)) * 2;
      } else {
        direction = Vector2.zero();
      }
    }

    if (isMoving) {
      position += direction.normalized() * speed * dt;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is ScreenHitbox) {
      // Handle collision with screen edges
      if (position.x <= 0 || position.x + size.x >= other.game.size.x) {
        direction.x = -direction.x; // Reverse X direction
      }
      if (position.y <= 0 || position.y + size.y >= other.game.size.y) {
        direction.y = -direction.y; // Reverse Y direction
      }
      // Prevent the sprite from going outside the bounds
      position.clamp(Vector2.zero(), other.size - size);
    }
    // void _keepInBounds() {
    //   final gameSize = gameRef.size;
    //   if (position.x < 0) position.x = 0;
    //   if (position.y < 0) position.y = 0;
    //   if (position.x + size.x > gameSize.x) position.x = gameSize.x - size.x;
    //   if (position.y + size.y > gameSize.y) position.y = gameSize.y - size.y;
    // }
  }
}

class gameScreen extends StatelessWidget  {
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
          backgroundBuilder: (context) => Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/grasstiles.png"),
                    fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }
}
