import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pig_farmer/pig_game.dart';

import 'package:pig_farmer/screens/pause_button.dart';
import 'package:pig_farmer/screens/title_screen.dart';

class PauseMenu extends StatelessWidget {
  static const String ID = "PauseMenu";
  final PigGame gameRef;
  const PauseMenu({Key? key, required this.gameRef}) : super(key: key);

  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        // Game title.
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Text(
              'Paused',
              style: TextStyle(fontSize: 50.0, color: Colors.white, shadows: [
                Shadow(
                    blurRadius: 15.0, color: Colors.green, offset: Offset(0, 0))
              ]),
            )),

        // Resume button.
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
            onPressed: () {
              gameRef.resumeEngine();
              gameRef.overlays.remove(PauseMenu.ID);
              gameRef.overlays.add(PauseButton.ID);
            },
            child: Text('Resume'),
          ),
        ),

        //TODO: Add Restart Button?

        // Exit button.
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
            onPressed: () {
              gameRef.overlays.remove(PauseMenu.ID);
              gameRef.reset();

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const TitleScreen(),
              ));
            },
            child: Text('Exit'),
          ),
        ),
      ],
    ));
  }
}
