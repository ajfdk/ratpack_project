import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'item_model.dart';
import 'item_widget.dart';
import 'player_guest.dart';
import 'pet_object.dart';
class PetRoomGame extends FlameGame with HasCollisionDetection, HasGameRef{
  late IdleSprite petMob;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // final petImage = await images.load('mogus.png');
    // pet_mob = Sprite(petImage);
    add(ScreenHitbox());
    petMob = IdleSprite()
      ..position = Vector2(100, 100)
      ..size = Vector2(50, 50);
    add(petMob);
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
      final screenSize = other.size;
      if (position.x <= 0 || position.x + size.x >= screenSize.x) {
        direction.x = -direction.x; // Reverse X direction
      }
      if (position.y <= 0 || position.y + size.y >= screenSize.y) {
        direction.y = -direction.y; // Reverse Y direction
      }
      // Prevent the sprite from going outside the bounds
      position.clamp(Vector2.zero(), screenSize - size);
    }
  }
}

class gameScreen extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Pet's Room"),
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

