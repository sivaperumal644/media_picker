import 'package:flutter/material.dart';
import 'package:media_picker/routes.dart';
import 'package:media_picker/screens/splash_screen.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: getRoute,
      home: SplashScreen(),
    );
  }
}
