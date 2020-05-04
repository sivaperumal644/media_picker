import 'package:media_picker/utils/base_equatable.dart';

class ImageViewingScreenEvent extends BaseEquatable {}

class ImageviewingScreenInitialEvent extends ImageViewingScreenEvent {
  @override
  String toString() {
    return "ImageViewInitialEvent";
  }
}
