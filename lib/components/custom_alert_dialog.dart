import 'package:flutter/material.dart';
import 'package:media_picker/utils/string_resource.dart';

import 'custom_text.dart';

class CustomAlertDialog extends StatelessWidget {
  final Function onCameraPressed;
  final Function onGalleryPressed;
  CustomAlertDialog({
    this.onCameraPressed,
    this.onGalleryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(
        text: StringResource.pickAnImageText,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: onCameraPressed,
            child: CustomText(text: StringResource.cameraText),
          ),
          Container(height: 16),
          InkWell(
            onTap: onGalleryPressed,
            child: CustomText(text: StringResource.galleryText),
          ),
        ],
      ),
    );
  }
}