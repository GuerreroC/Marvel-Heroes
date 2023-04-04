import 'package:dacodes/routes/heroes/heroes.view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //Make sure there is a WidgetsBinding instance.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Lock App in Portrait
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return const MaterialApp(
      //Debug banner
      debugShowCheckedModeBanner: kDebugMode,

      //Due that this Test App is Single-Page app
      //the routes are not implemented
      home: HeroesScreen(),
    );
  }
}
