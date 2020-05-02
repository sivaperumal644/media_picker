import 'package:media_picker/utils/base_equatable.dart';

class ImageHtmlEvent extends BaseEquatable {}

class ImageHtmlButtonPressedEvent extends ImageHtmlEvent {
  String imgSrc;
  ImageHtmlButtonPressedEvent(this.imgSrc);
  @override
  String toString() {
    return "HTMLImageButtonPressedEvent";
  }
}
