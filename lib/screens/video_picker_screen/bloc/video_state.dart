
import 'package:media_picker/utils/base_equatable.dart';

class VideoState extends BaseEquatable {}

class VideoInitialState extends VideoState {
  @override
  String toString() {
    return "VideoInitialState";
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
