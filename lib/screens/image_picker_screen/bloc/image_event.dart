import 'dart:io';

import 'package:media_picker/utils/base_equatable.dart';

class ImageEvent extends BaseEquatable {}

class ImageCaptureButtonPressedEvent extends ImageEvent {
  @override
  String toString() {
    return "ImageCaptureButtonPressedEvent";
  }
}

class ImageFromCameraButtonPressedEvent extends ImageEvent {
  @override
  String toString() {
    return "ImageFromCameraButtonPressedEvent";
  }
}

class ImageFromGalleryButtonPressedEvent extends ImageEvent {
  @override
  String toString() {
    return "ImageFromGalleryButtonPressedEvent";
  }
}

class NavigateButtonPressedEvent extends ImageEvent {
  @override
  String toString() {
    return "NavigateButtonPressedEvent";
  }
}

class ImageViewNavigateEvent extends ImageEvent {
  File image;
  ImageViewNavigateEvent(this.image);
  @override
  String toString() {
    return "ImageViewNavigateEvent";
  }
}
