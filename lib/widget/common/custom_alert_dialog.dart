import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_picker/utils/color_resource.dart';
import 'package:media_picker/utils/string_resource.dart';

import 'custom_text.dart';

class CustomAlertDialog extends StatelessWidget {
  final Function onCameraPressed;
  final Function onGalleryPressed;
  final String titleText;
  CustomAlertDialog({
    this.onCameraPressed,
    this.onGalleryPressed,
    this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      title: CustomText(
        text: titleText,
        textAlign: TextAlign.center,
        style: GoogleFonts.aBeeZee(
          fontSize: 20,
          color: ColorResource.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 12),
          InkWell(
            onTap: onCameraPressed,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 42,
              child: Center(
                child: CustomText(
                  text: StringResource.cameraText,
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onGalleryPressed,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 42,
              child: Center(
                child: CustomText(
                  text: StringResource.galleryText,
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24)
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
