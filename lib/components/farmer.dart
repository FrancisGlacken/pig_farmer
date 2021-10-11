import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pig_farmer/pig_game.dart';

class Farmer extends SpriteAnimationComponent
    with HasGameRef<PigGame>, Hitbox, Collidable, KeyboardHandler {
  num speedModifierX = 0;
  num speedModifierY = 0;
  bool _isMoving = false;

  Farmer({
    SpriteAnimation? anim,
    Vector2? position,
    Vector2? size,
  }) : super(animation: anim, position: position, size: size);

  // @override
  // Future<void>? onLoad() async {
  //   final hitBox = HitboxPolygon(
  //       [Vector2(0, 1), Vector2(-1, 0), Vector2(0, -1), Vector2(1, 0)]);

  //   addHitbox(hitBox);
  // }

  @override
  void update(double dt) {
    super.update(dt);
    // speedModifierX -= speedModifierX * .01;
    // speedModifierY -= speedModifierY * .01;
    if (_isMoving) {
      position.x += speedModifierX * dt;
      position.y += speedModifierY * dt;
    } else {
      speedModifierX = 0;
      speedModifierY = 0;
    }
  }

  @override
  bool onKeyEvent(
    RawKeyEvent e,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = e is RawKeyDownEvent;

    if (isKeyDown) {
      _isMoving = true;
      // if (e.data.keyLabel == 'a' && e.data.keyLabel == 'w') {
      //   speedModifierX = isKeyDown ? -50 : 0;
      //   speedModifierY = isKeyDown ? -50 : 0;
      // }
      // if (e.data.keyLabel == 'w' && e.data.keyLabel == 'd') {
      //   speedModifierX = isKeyDown ? 50 : 0;
      //   speedModifierY = isKeyDown ? 50 : 0;
      // }
      // if (e.data.keyLabel == 'd' && e.data.keyLabel == 's') {
      //   speedModifierX = isKeyDown ? -50 : 0;
      //   speedModifierY = isKeyDown ? -50 : 0;
      // }
      // if (e.data.keyLabel == 's' && e.data.keyLabel == 'a') {
      //   speedModifierX = isKeyDown ? -50 : 0;
      //   speedModifierY = isKeyDown ? -50 : 0;
      // } else
      if (e.data.keyLabel == 'a') {
        speedModifierX = isKeyDown ? -100 : 0;
      } else if (e.data.keyLabel == 'd') {
        speedModifierX = isKeyDown ? 100 : 0;
      } else if (e.data.keyLabel == 'w') {
        speedModifierY = isKeyDown ? -100 : 0;
      } else if (e.data.keyLabel == 's') {
        speedModifierY = isKeyDown ? 100 : 0;
      }

      return true;
    }

    _isMoving = false;
    return false;
  }

  @override
  void onCollision(Set<Vector2> points, Collidable other) {
    // if (other is CollidableScreen) {
    //   ...
    // } else if (other is YourOtherCollidable) {
    //   ...
    // }
  }

  @override
  void onCollisionEnd(Collidable other) {
    // if (other is CollidableScreen) {
    //   ...
    // } else if (other is YourOtherCollidable) {
    //   ...
    // }
  }
}
