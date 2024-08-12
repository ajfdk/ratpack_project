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

late spriteHead petMobHead;
late spriteLegs petMobLegs;

double legsX = 145;
double legsY = 160;
//double spriteSize = 175;
double spriteSize = 75;
class PetView extends FlameGame{
  Future<void> onLoad() async {
    super.onLoad();
    //final petImage = await images.load('mogus.png');
    // pet_mob = Sprite(petImage);
    add(ScreenHitbox());
    petMobHead = spriteHead()
      ..position = Vector2(legsX, legsY-75)
      ..size = Vector2(spriteSize, spriteSize);
    petMobLegs = spriteLegs()
      ..position = Vector2(legsX,legsY)
      ..size = Vector2(spriteSize,spriteSize);
    add(petMobHead);
    add(petMobLegs);
  }
  }

class spriteHead extends SpriteComponent with CollisionCallbacks {
  static const double speed = 100;
  Vector2 direction = Vector2.zero();
  bool isMoving = false;
  double timeToChangeDirection = 2.0;
  double timePassed = 0.0;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load(playerPet.petSpriteHead);
    add(RectangleHitbox());
  }
}
class spriteLegs extends SpriteComponent with CollisionCallbacks {
  static const double speed = 100;
  Vector2 direction = Vector2.zero();
  bool isMoving = false;
  double timeToChangeDirection = 2.0;
  double timePassed = 0.0;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load(playerPet.petSpriteLegs);
    //sprite = await Sprite.load(playerPet.petSpriteLegs);
    add(RectangleHitbox());
  }
}