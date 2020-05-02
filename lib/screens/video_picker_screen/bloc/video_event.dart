import 'package:media_picker/utils/base_equatable.dart';

class VideoEvent extends BaseEquatable {}

class VideoCaptureButtonPressedEvent extends VideoEvent{
  @override
  String toString() {
    return "VideoCaptureButtonPressedEvent";
  }
}

class VideoFromCameraButtonPressedEvent extends VideoEvent{
  @override
  String toString() {
    return "VideoFromCameraButtonPressedEvent";
  }
}

class VideoFromGalleryButtonPressedEvent extends VideoEvent{
  @override
  String toString() {
    return "VideoFromGalleryButtonPressedEvent";
  }
}

class VideoPlayButtonPressedEvent extends VideoEvent{
  @override
  String toString() {
    return "VideoPlayButtonPressedEvent";
  }
}

class VideoPauseButtonPressedEvent extends VideoEvent{
  @override
  String toString() {
    return "VideoPauseButtonPressedEvent";
  }
}