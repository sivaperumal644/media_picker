import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_event.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  File image;
  @override
  ImageState get initialState => ImageInitialState();

  @override
  Stream<ImageState> mapEventToState(ImageEvent event) async* {
    if (event is ImageCaptureButtonPressedEvent) {
      yield ImageDialogState();
    }
    if (event is ImageFromCameraButtonPressedEvent) {
      image = await getImage(ImageSource.camera);
      if (image != null) yield ImageAvailableState();
    }
    if (event is ImageFromGalleryButtonPressedEvent) {
      image = await getImage(ImageSource.gallery);
      if (image != null) yield ImageAvailableState();
    }
    if (event is NavigateButtonPressedEvent) {
      yield VideoNavigateState();
    }
    if (event is ImageViewNavigateEvent) {
      yield ImageViewNavigateState(event.image);
    }
  }

  Future getImage(ImageSource source) async {
    var imageFile = await ImagePicker.pickImage(source: source);
    return imageFile;
  }
}
