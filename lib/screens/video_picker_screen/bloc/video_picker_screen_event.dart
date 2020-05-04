import 'package:media_picker/utils/base_equatable.dart';

class VideoPickerScreenEvent extends BaseEquatable {}

class VideoPickerScreenCaptureButtonPressedEvent extends VideoPickerScreenEvent{
  @override
  String toString() {
    return "VideoCaptureButtonPressedEvent";
  }
}

class VideoPickerScreenCameraButtonPressedEvent extends VideoPickerScreenEvent{
  @override
  String toString() {
    return "VideoFromCameraButtonPressedEvent";
  }
}

class VideoPickerScreenGalleryButtonPressedEvent extends VideoPickerScreenEvent{
  @override
  String toString() {
    return "VideoFromGalleryButtonPressedEvent";
  }
}
