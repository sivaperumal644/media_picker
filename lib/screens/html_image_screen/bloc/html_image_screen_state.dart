import 'package:media_picker/utils/base_equatable.dart';

class HtmlImageScreenState extends BaseEquatable {}

class ImageHtmlInitialState extends HtmlImageScreenState {
  @override
  String toString() {
    return "ImageHtmlInitialState";
  }
}

class HtmlImageButtonPressedState extends HtmlImageScreenState {
  String imageSource;
  HtmlImageButtonPressedState(this.imageSource);
  @override
  bool operator ==(Object other) => false;
  @override
  String toString() {
    return "ImageHtmlButtonPressedState";
  }
}
