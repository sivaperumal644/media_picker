import 'dart:io';

import 'package:media_picker/utils/base_equatable.dart';

class ImagePickerScreenState extends BaseEquatable {}

class ImagePickerScreenInitialState extends ImagePickerScreenState {
  @override
  String toString() {
    return "ImageInitialState";
  }
}

class ImagePickerScreenImageAvailableState extends ImagePickerScreenState {
  @override
  bool operator ==(Object other) => false;

  @override
  String toString() {
    return "ImageAvailableState";
  }
}

class ImagePickerScreenNavigateState extends ImagePickerScreenState {
  File image;
  ImagePickerScreenNavigateState(this.image);
  @override
  bool operator ==(Object other) => false;
  @override
  String toString() {
    return "ImageViewNavigateState";
  }
}
