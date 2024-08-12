import 'dart:math';
import 'package:flutter/material.dart';
import 'item_model.dart';
import 'item_widget.dart';
import 'player_guest.dart';
import 'pet_object.dart';
import 'package:flame/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

late IdleSprite petMob;

class PetView extends FlameGame{
  Future<void> onLoad() async {
    super.onLoad();
    // final petImage = await images.load('mogus.png');
    // pet_mob = Sprite(petImage);
    add(ScreenHitbox());
    petMob = IdleSprite()
      ..position = Vector2(100, 50)
      ..size = Vector2(175, 175);
    add(petMob);
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
}