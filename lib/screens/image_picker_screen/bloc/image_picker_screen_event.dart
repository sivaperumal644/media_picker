import 'dart:io';

import 'package:media_picker/utils/base_equatable.dart';

class ImagePickerScreenEvent extends BaseEquatable {}

class ImagePickerScreenCaptureButtonPressedEvent extends ImagePickerScreenEvent {
  @override
  String toString() {
    return "ImageCaptureButtonPressedEvent";
  }
}

class ImagePickerScreenCameraButtonPressedEvent extends ImagePickerScreenEvent {
  @override
  String toString() {
    return "ImageFromCameraButtonPressedEvent";
  }
}

class ImagePickerScreenGalleryButtonPressedEvent extends ImagePickerScreenEvent {
  @override
  String toString() {
    return "ImageFromGalleryButtonPressedEvent";
  }
}

class ImagePickerScreenNavigateEvent extends ImagePickerScreenEvent {
  File image;
  ImagePickerScreenNavigateEvent(this.image);
  @override
  String toString() {
    return "ImageViewNavigateEvent";
  }
}
