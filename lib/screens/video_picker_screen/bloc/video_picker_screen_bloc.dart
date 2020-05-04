import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_picker/screens/video_picker_screen/bloc/video_picker_screen_event.dart';
import 'package:media_picker/screens/video_picker_screen/bloc/video_picker_screen_state.dart';
import 'package:video_player/video_player.dart';

class VideoPickerScreenBloc extends Bloc<VideoPickerScreenEvent, VideoPickerScreenState> {
  ChewieController chewieController;
  VideoPlayerController videoPlayerController;

  @override
  VideoPickerScreenState get initialState => VideoPickerScreenInitialState();

  @override
  Stream<VideoPickerScreenState> mapEventToState(VideoPickerScreenEvent event) async* {
    if (event is VideoPickerScreenCameraButtonPressedEvent) {
      chewieController = await getVideo(ImageSource.camera);
      if (chewieController != null) yield VideoPickerScreenVideoAvailableState();
    }
    if (event is VideoPickerScreenGalleryButtonPressedEvent) {
      chewieController = await getVideo(ImageSource.gallery);
      if (chewieController != null) yield VideoPickerScreenVideoAvailableState();
    }
  }

  getVideo(ImageSource source) async {
    var videoFile = await ImagePicker.pickVideo(source: source);
    videoPlayerController = VideoPlayerController.file(videoFile);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: videoPlayerController.value.aspectRatio,
      autoPlay: true,
      looping: false,
    );
    return chewieController;
  }
}
