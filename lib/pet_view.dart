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
double spriteSize = 75;
class PetView extends FlameGame{
  Future<void> onLoad() async {
    super.onLoad();
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
  Vector2 direction = Vector2.zero();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load(playerPet.petSpriteHead);
  }
}
class spriteLegs extends SpriteComponent with CollisionCallbacks {
  Vector2 direction = Vector2.zero();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load(playerPet.petSpriteLegs);
  }
}