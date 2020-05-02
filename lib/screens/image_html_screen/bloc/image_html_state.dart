import 'package:media_picker/utils/base_equatable.dart';

class ImageHtmlState extends BaseEquatable {}

class ImageHtmlInitialState extends ImageHtmlState {
  @override
  String toString() {
    return "ImageHtmlInitialState";
  }
}

class ImageHtmlButtonPressedState extends ImageHtmlState {
  String imgSrc;
  ImageHtmlButtonPressedState(this.imgSrc);
  @override
  bool operator ==(Object other) => false;
  @override
  String toString() {
    return "ImageHtmlButtonPressedState";
  }
}
