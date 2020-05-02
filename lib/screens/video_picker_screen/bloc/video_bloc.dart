import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_picker/screens/video_picker_screen/bloc/video_event.dart';
import 'package:media_picker/screens/video_picker_screen/bloc/video_state.dart';
import 'package:video_player/video_player.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  ChewieController chewieController;

  @override
  VideoState get initialState => VideoInitialState();

  @override
  Stream<VideoState> mapEventToState(VideoEvent event) async* {
    if (event is VideoCaptureButtonPressedEvent) {
      yield VideoDialogState();
    }
    if (event is VideoFromCameraButtonPressedEvent) {
      chewieController = await getVideo(ImageSource.camera);
      if (chewieController != null) yield VideoAvailableState();
    }
    if (event is VideoFromGalleryButtonPressedEvent) {
      chewieController = await getVideo(ImageSource.gallery);
      if (chewieController != null) yield VideoAvailableState();
    }
  }

  getVideo(ImageSource source) async {
    var videoFile = await ImagePicker.pickVideo(source: source);
    VideoPlayerController cameraVideoPlayerController =
        VideoPlayerController.file(videoFile);
    chewieController = ChewieController(
      videoPlayerController: cameraVideoPlayerController,
      aspectRatio: cameraVideoPlayerController.value.aspectRatio,
      autoPlay: true,
      looping: false,
    );
    return chewieController;
  }
}
