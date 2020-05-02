import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_view_event.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_view_state.dart';

class ImageViewBloc extends Bloc<ImageViewEvent, ImageViewState> {
  File image;
  String imageString;
  
  ImageViewBloc(args) {
    this.image = args.image;
    this.imageString = args.imageString;
  }
  @override
  ImageViewState get initialState => ImageViewInitialState();

  @override
  Stream<ImageViewState> mapEventToState(ImageViewEvent event) async* {}
}

class ImageViewArgs {
  File image;
  String imageString;

  ImageViewArgs({this.image, this.imageString});
}
