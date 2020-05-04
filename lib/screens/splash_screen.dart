import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_picker/routes.dart';
import 'package:media_picker/utils/color_resource.dart';
import 'package:media_picker/utils/image_resource.dart';
import 'package:media_picker/utils/string_resource.dart';
import 'package:media_picker/widget/common/custom_image.dart';
import 'package:media_picker/widget/common/custom_scaffold.dart';
import 'package:media_picker/widget/common/custom_text.dart';

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
    return CustomScaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CustomImage(
              image: ImageResourse.cameraImage,
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
              color: ColorResource.primaryColor,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
