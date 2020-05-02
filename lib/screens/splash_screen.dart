import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_picker/routes.dart';
import 'package:media_picker/utils/image_resource.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.IMAGE_PICKER_SCREEN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Image.asset(
          ImageResourse.cameraImage,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
