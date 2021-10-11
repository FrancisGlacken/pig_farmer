import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:pig_farmer/pig_game.dart';
import 'package:pig_farmer/screens/pause_button.dart';
import 'package:pig_farmer/screens/pause_menu.dart';

// Creating this as a file private object so as to
// avoid unwanted rebuilds of the whole game object.
PigGame _pigGame = PigGame();

// This class represents the actual game screen
// where all the action happens.
class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // WillPopScope provides us a way to decide if
      // this widget should be poped or not when user
      // presses the back button.
      body: WillPopScope(
        onWillPop: () async => false,
        // GameWidget is useful to inject the underlying
        // widget of any class extending from Flame's Game class.
        child: GameWidget(
          game: _pigGame,
          initialActiveOverlays: [PauseButton.ID],
          overlayBuilderMap: {
            PauseButton.ID: (BuildContext context, PigGame gameRef) =>
                PauseButton(
                  gameRef: gameRef,
                ),
            PauseMenu.ID: (BuildContext context, PigGame gameRef) => PauseMenu(
                  gameRef: gameRef,
                ),
          },
          // Initially only pause button overlay will be visible.
          // initialActiveOverlays: [PauseButton.ID],
          // overlayBuilderMap: {
          //   PauseButton.ID: (BuildContext context, SpacescapeGame gameRef) =>
          //       PauseButton(
          //         gameRef: gameRef,
          //       ),
          //   PauseMenu.ID: (BuildContext context, SpacescapeGame gameRef) =>
          //       PauseMenu(
          //         gameRef: gameRef,
          //       ),
          //   GameOverMenu.ID: (BuildContext context, SpacescapeGame gameRef) =>
          //       GameOverMenu(
          //         gameRef: gameRef,
          //       ),
          // },
        ),
      ),
    );
  }
}
