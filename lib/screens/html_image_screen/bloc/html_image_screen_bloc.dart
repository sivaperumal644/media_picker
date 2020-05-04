import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/screens/html_image_screen/bloc/html_image_screen_event.dart';
import 'package:media_picker/screens/html_image_screen/bloc/html_image_screen_state.dart';

class HtmlImageScreenBloc
    extends Bloc<HtmlImageScreenEvent, HtmlImageScreenState> {
  String htmlString = """
  <div>
      <h1>Image from HTML</h1>
      <img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" />
      <!--You can pretty much put any html in here!-->
    </div>
  """;
  @override
  HtmlImageScreenState get initialState => ImageHtmlInitialState();

  @override
  Stream<HtmlImageScreenState> mapEventToState(
      HtmlImageScreenEvent event) async* {
    if (event is HtmlImageButtonPressedEvent) {
      yield HtmlImageButtonPressedState(event.imageSource);
    }
  }
}
