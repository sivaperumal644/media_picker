import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_picker/utils/color_resource.dart';
import 'package:media_picker/widget/common/custom_text.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  PrimaryButton({
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 16),
        color: ColorResource.primaryColor.withOpacity(0.9),
        onPressed: onPressed,
        child: CustomText(
          text: buttonText,
          style: GoogleFonts.quicksand(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
