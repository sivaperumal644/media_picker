import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_picker_screen_event.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_picker_screen_state.dart';

class ImagePickerScreenBloc extends Bloc<ImagePickerScreenEvent, ImagePickerScreenState> {
  File image;
  @override
  ImagePickerScreenState get initialState => ImagePickerScreenInitialState();

  @override
  Stream<ImagePickerScreenState> mapEventToState(ImagePickerScreenEvent event) async* {
    if (event is ImagePickerScreenCameraButtonPressedEvent) {
      image = await getImage(ImageSource.camera);
      if (image != null) yield ImagePickerScreenImageAvailableState();
    }
    if (event is ImagePickerScreenGalleryButtonPressedEvent) {
      image = await getImage(ImageSource.gallery);
      if (image != null) yield ImagePickerScreenImageAvailableState();
    }
    if (event is ImagePickerScreenNavigateEvent) {
      yield ImagePickerScreenNavigateState(event.image);
    }
  }

  Future getImage(ImageSource source) async {
    var imageFile = await ImagePicker.pickImage(source: source);
    return imageFile;
  }
}
