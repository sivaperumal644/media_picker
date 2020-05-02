import 'package:media_picker/utils/base_equatable.dart';

class HomeState extends BaseEquatable {}

class HomeInitialState extends HomeState{
  @override
  String toString() {
    return "HomeInitialState";
  }
}

class HomeImageButtonPressedState extends HomeState {
  @override
  bool operator ==(Object other) => false;
  @override
  String toString() {
    return "HomeImageButtonPressedState";
  }
}

class HomeVideoButtonPressedState extends HomeState {
  @override
  bool operator ==(Object other) => false;
  @override
  String toString() {
    return "HomeVideoButtonPressedState";
  }
}

class HomeHtmlImageButtonPressedState extends HomeState {
  @override
  bool operator ==(Object other) => false;
  @override
  String toString() {
    return "HomeHtmlImageButtonPressedState";
  }
}
