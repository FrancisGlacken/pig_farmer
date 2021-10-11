import 'package:flutter/material.dart';
import 'package:pig_farmer/screens/game_screen.dart';

// Represents the main menu screen of Spacescape, allowing
// players to start the game or modify in-game settings.
class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 33, 200),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Game title.
            Container(
                padding: EdgeInsets.all(32),
                width: MediaQuery.of(context).size.width / 3,
                height: 120,
                child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset('assets/images/title.png'))),

            // Play button.
            SizedBox(
              width: MediaQuery.of(context).size.width / 10,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(),
                    ),
                  );
                },
                child: Text('Play'),
              ),
            ),

            // Options button.
            SizedBox(
              width: MediaQuery.of(context).size.width / 10,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {
                  // TODO: Navigate to options screen.
                },
                child: Text('Options'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
