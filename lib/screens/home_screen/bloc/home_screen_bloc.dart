import 'package:bloc/bloc.dart';
import 'package:media_picker/screens/home_screen/bloc/home_screen_event.dart';
import 'package:media_picker/screens/home_screen/bloc/home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  @override
  HomeScreenState get initialState => HomeScreenInitialState();

  @override
  Stream<HomeScreenState> mapEventToState(HomeScreenEvent event) async* {
    if (event is HomeScreenImageButtonPressedEvent) {
      yield HomeScreenImageButtonPressedState();
    }
    if (event is HomeScreenVideoButtonPressedEvent) {
      yield HomeScreenVideoButtonPressedState();
    }
    if (event is HomeScreenHtmlImageButtonPressedEvent) {
      yield HomeScreenHtmlImageButtonPressedState();
    }
  }
}
