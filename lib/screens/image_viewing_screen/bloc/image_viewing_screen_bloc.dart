import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_viewing_screen_event.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_viewing_screen_state.dart';

class ImageViewingScreenBloc extends Bloc<ImageViewingScreenEvent, ImageViewingScreenState> {
  File fileImage;
  String stringImage;

  ImageViewingScreenBloc(args) {
    if (args.fileImage != null) this.fileImage = args.fileImage;
    if (args.stringImage != null) this.stringImage = args.stringImage;
  }
  @override
  ImageViewingScreenState get initialState => ImageViewingScreenInitialState();

  @override
  Stream<ImageViewingScreenState> mapEventToState(ImageViewingScreenEvent event) async* {}
}

class ImageViewArgs {
  File fileImage;
  String stringImage;

  ImageViewArgs({this.fileImage, this.stringImage});
}
