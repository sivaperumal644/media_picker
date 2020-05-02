import 'dart:io';

import 'package:media_picker/utils/base_equatable.dart';

class ImageState extends BaseEquatable {}

class ImageInitialState extends ImageState {
  @override
  String toString() {
    return "ImageInitialState";
  }
}

class ImageDialogState extends ImageState {
  @override
  String toString() {
    return "ImageDialogState";
  }
}

class ImageAvailableState extends ImageState {
  @override
  bool operator ==(Object other) => false;

  @override
  String toString() {
    return "ImageAvailableState";
  }
}

class ImageViewNavigateState extends ImageState {
  File image;
  ImageViewNavigateState(this.image);
  @override
  bool operator ==(Object other) => false;
  @override
  String toString() {
    return "ImageViewNavigateState";
  }
}

class VideoNavigateState extends ImageState {
  @override
  bool operator ==(Object other) => false;
  @override
  String toString() {
    return "VideoNavigateState";
  }
}
