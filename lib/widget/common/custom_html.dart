import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

class CustomHtml extends StatelessWidget {
  EdgeInsets padding;
  String data;
  Function(String) onImageTap;

  CustomHtml({
    this.padding,
    this.data,
    this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Html(
      padding: padding,
      data: data,
      onImageTap: onImageTap,
    );
  }
}
