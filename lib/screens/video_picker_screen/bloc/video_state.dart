
import 'package:media_picker/utils/base_equatable.dart';

class VideoState extends BaseEquatable {}

class VideoInitialState extends VideoState {
  @override
  String toString() {
    return "VideoInitialState";
  }
}

class VideoPlayingState extends VideoState {
  @override
  bool operator ==(Object other) => false;

  @override
  String toString() {
    return "VideoPlayingState";
  }
}

class VideoPausedState extends VideoState {
  @override
  bool operator ==(Object other) => false;

  @override
  String toString() {
    return "VideoPausedState";
  }
}

class VideoAvailableState extends VideoState {
  @override
  bool operator ==(Object other) => false;

  @override
  String toString() {
    return "VideoAvailableState";
  }
}

class VideoDialogState extends VideoState {
  @override
  String toString() {
    return "VideoDialogState";
  }
}
