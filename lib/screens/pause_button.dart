import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pig_farmer/pig_game.dart';
import 'package:pig_farmer/screens/pause_menu.dart';

class PauseButton extends StatelessWidget {
  static const String ID = 'PauseButton';
  final PigGame gameRef;

  const PauseButton({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: TextButton(
          child: Icon(Icons.pause_rounded, color: Colors.white),
          onPressed: () {
            gameRef.pauseEngine();
            gameRef.overlays.add(PauseMenu.ID);
            gameRef.overlays.add(PauseMenu.ID);
          }),
    );
  }
}
