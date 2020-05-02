import 'package:media_picker/utils/base_equatable.dart';

class HomeEvent extends BaseEquatable {}

class HomeImageButtonPressedEvent extends HomeEvent{
  @override
  String toString() {
    return "HomeImageButtonPressedEvent";
  }
}

class HomeVideoButtonPressedEvent extends HomeEvent{
  @override
  String toString() {
    return "HomeVideoButtonPressedEvent";
  }
}

class HomeHtmlImageButtonPressedEvent extends HomeEvent{
  @override
  String toString() {
    return "HomeHtmlImageButtonPressedEvent";
  }
}