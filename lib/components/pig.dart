import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import 'package:pig_farmer/pig_game.dart';

class Pig extends SpriteAnimationComponent
    with HasGameRef<PigGame>, Hitbox, Collidable {
  num speedModifier = 80;
  Random rng = new Random();
  late SpriteAnimation pigAnimUp;

  Pig({
    SpriteAnimation? anim,
    Vector2? position,
    Vector2? size,
  }) : super(animation: anim, position: position, size: size);

  @override
  Future<void>? onLoad() async {
    final pigAnimLeft = gameRef.pigSheet.createAnimation(row: 3, stepTime: .7);
    final pigAnimRight = gameRef.pigSheet.createAnimation(row: 1, stepTime: .7);
    pigAnimUp = gameRef.pigSheet.createAnimation(row: 2, stepTime: .7);
    final hitBox = HitboxPolygon(
        [Vector2(0, 1), Vector2(-1, 0), Vector2(0, -1), Vector2(1, 0)]);

    addHitbox(hitBox);
  }

  void changePigAnimation() {
    animation = pigAnimUp;
  }

  @override
  void update(double dt) {
    x += speedModifier * dt;
    // speedModifier -= .5;
    // if (speedModifier <= 4) speedModifier = 80;
    // y = y + speedModifier * dt;

    // if (x < -100 ||
    //     x > gameRef.size.x + 500 ||
    //     y < -500 ||
    //     y > gameRef.size.y + 100) {
    //   shouldRemove = true;
    // }
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> points, Collidable other) {
    if (other is ScreenCollidable) {
      if (speedModifier > 0) {
        speedModifier = -80;
        changePigAnimation();
      } else {
        speedModifier = 80;
        changePigAnimation();
      }
    }
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
