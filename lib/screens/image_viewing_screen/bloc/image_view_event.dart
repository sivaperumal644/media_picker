import 'package:media_picker/utils/base_equatable.dart';

class ImageViewEvent extends BaseEquatable {}

class ImageviewInitialEvent extends ImageViewEvent{
  @override
  String toString() {
    return "ImageViewInitialEvent";
  }
}
