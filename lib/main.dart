import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pig_farmer/screens/game_screen.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Flame.device.fullScreen();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // Dark more because we are too cool for white theme.
      themeMode: ThemeMode.dark,
      // Use custom theme with 'BungeeInline' font.
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'BungeeInline',
        scaffoldBackgroundColor: Colors.black,
      ),

      home: const GameScreen(),
    ),
  );
}
