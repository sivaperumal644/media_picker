import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  String image;
  double height;
  double width;
  BoxFit fit;

  CustomImage({
    this.image,
    this.height,
    this.width,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height,
      width: width,
      fit: fit,
    );
  }
}
