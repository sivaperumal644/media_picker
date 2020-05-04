import 'package:media_picker/utils/base_equatable.dart';

class HomeScreenState extends BaseEquatable {}

class HomeScreenInitialState extends HomeScreenState{
  @override
  String toString() {
    return "HomeInitialState";
  }
}

class HomeScreenImageButtonPressedState extends HomeScreenState {
  @override
  bool operator ==(Object other) => false;
  @override
  String toString() {
    return "HomeImageButtonPressedState";
  }
}

class HomeScreenVideoButtonPressedState extends HomeScreenState {
  @override
  bool operator ==(Object other) => false;
  @override
  String toString() {
    return "HomeVideoButtonPressedState";
  }
}

class HomeScreenHtmlImageButtonPressedState extends HomeScreenState {
  @override
  bool operator ==(Object other) => false;
  @override
  String toString() {
    return "HomeHtmlImageButtonPressedState";
  }
}
