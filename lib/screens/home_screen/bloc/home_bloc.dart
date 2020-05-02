import 'package:bloc/bloc.dart';
import 'package:media_picker/screens/home_screen/bloc/home_event.dart';
import 'package:media_picker/screens/home_screen/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeImageButtonPressedEvent) {
      yield HomeImageButtonPressedState();
    }
    if (event is HomeVideoButtonPressedEvent) {
      yield HomeVideoButtonPressedState();
    }
    if (event is HomeHtmlImageButtonPressedEvent) {
      yield HomeHtmlImageButtonPressedState();
    }
  }
}
