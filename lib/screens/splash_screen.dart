import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_picker/components/custom_text.dart';
import 'package:media_picker/routes.dart';
import 'package:media_picker/utils/image_resource.dart';
import 'package:media_picker/utils/string_resource.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.HOME_SCREEN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              ImageResourse.cameraImage,
              width: 150,
              height: 150,
            ),
          ),
          SizedBox(height: 24),
          CustomText(
            text: StringResource.mediaPickerText,
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
              fontSize: 36,
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
