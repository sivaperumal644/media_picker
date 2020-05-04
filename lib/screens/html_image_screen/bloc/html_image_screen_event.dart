import 'package:media_picker/utils/base_equatable.dart';

class HtmlImageScreenEvent extends BaseEquatable {}

class HtmlImageButtonPressedEvent extends HtmlImageScreenEvent {
  String imageSource;
  HtmlImageButtonPressedEvent(this.imageSource);
  @override
  String toString() {
    return "HTMLImageButtonPressedEvent";
  }
}
