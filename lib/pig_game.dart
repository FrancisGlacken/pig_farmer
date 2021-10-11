import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pig_farmer/components/farmer.dart';
import 'package:pig_farmer/components/pig.dart';

class PigGame extends FlameGame
    with HasCollidables, HasKeyboardHandlerComponents {
  late Farmer farmer;
  late SpriteSheet pigSheet;
  @override
  Future<void>? onLoad() async {
    Sprite bg = await Sprite.load("grass_bg.png");
    final pigImage = await images.load("stardew_pigs.png");
    final farmerImage = await images.load("farmer.png");
    pigSheet = SpriteSheet(
      image: pigImage,
      srcSize: Vector2.all(32.0),
    );
    final farmerSheet =
        SpriteSheet(image: farmerImage, srcSize: Vector2.all(16));

    Pig pig = Pig(
        anim: pigSheet.createAnimation(row: 1, stepTime: 1),
        size: Vector2.all(64),
        position: Vector2(10, 100));
    farmer = Farmer(
        anim: farmerSheet.createAnimation(row: 0, stepTime: .7),
        size: Vector2.all(32),
        position: Vector2(0, 0));

    add(SpriteComponent(sprite: bg));
    add(pig);
    add(farmer);
    add(ScreenCollidable());
  }

  void reset() {}

  // @override
  // KeyEventResult onKeyEvent(
  //   RawKeyEvent event,
  //   Set<LogicalKeyboardKey> keysPressed,
  // ) {
  //   final isKeyDown = event is RawKeyDownEvent;

  //   if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
  //     farmer.moveRight();
  //   } else if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
  //     farmer.moveLeft();
  //   } else if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
  //     farmer.moveUp();
  //   } else if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
  //     farmer.moveDown();
  //   } else if (keysPressed.contains(LogicalKeyboardKey.arrowRight) &&
  //       keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
  //     farmer.moveDown();
  //   }
  //   return KeyEventResult.handled;
  // }
}

//class Pig extends Sprite {}
