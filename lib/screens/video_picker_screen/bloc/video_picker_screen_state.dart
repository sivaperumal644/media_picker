
import 'package:media_picker/utils/base_equatable.dart';

class VideoPickerScreenState extends BaseEquatable {}

class VideoPickerScreenInitialState extends VideoPickerScreenState {
  @override
  String toString() {
    return "VideoInitialState";
  }
}

class VideoPickerScreenVideoAvailableState extends VideoPickerScreenState {
  @override
  bool operator ==(Object other) => false;

  @override
  String toString() {
    return "VideoAvailableState";
  }
}

