import 'package:media_picker/utils/base_equatable.dart';

class HomeScreenEvent extends BaseEquatable {}

class HomeScreenImageButtonPressedEvent extends HomeScreenEvent{
  @override
  String toString() {
    return "HomeImageButtonPressedEvent";
  }
}

class HomeScreenVideoButtonPressedEvent extends HomeScreenEvent{
  @override
  String toString() {
    return "HomeVideoButtonPressedEvent";
  }
}

class HomeScreenHtmlImageButtonPressedEvent extends HomeScreenEvent{
  @override
  String toString() {
    return "HomeHtmlImageButtonPressedEvent";
  }
}