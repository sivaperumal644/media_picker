import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/screens/image_html_screen/bloc/image_html_event.dart';
import 'package:media_picker/screens/image_html_screen/bloc/image_html_state.dart';

class ImageHtmlBloc extends Bloc<ImageHtmlEvent, ImageHtmlState> {
  @override
  ImageHtmlState get initialState => ImageHtmlState();

  @override
  Stream<ImageHtmlState> mapEventToState(ImageHtmlEvent event) async* {
    if (event is ImageHtmlButtonPressedEvent) {
      yield ImageHtmlButtonPressedState(event.imgSrc);
    }
  }
}
