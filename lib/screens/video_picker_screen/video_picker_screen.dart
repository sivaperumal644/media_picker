import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/components/custom_alert_dialog.dart';
import 'package:media_picker/components/custom_text.dart';
import 'package:media_picker/routes.dart';
import 'package:media_picker/screens/image_html_screen/image_html_screen.dart';
import 'package:media_picker/screens/video_picker_screen/bloc/video_event.dart';
import 'package:media_picker/utils/string_resource.dart';
import 'bloc/video_bloc.dart';
import 'bloc/video_state.dart';

class VideoPickerScreen extends StatefulWidget {
  @override
  _VideoPickerScreenState createState() => _VideoPickerScreenState();
}

class _VideoPickerScreenState extends State<VideoPickerScreen> {
  VideoBloc videoBloc;

  @override
  void initState() {
    super.initState();
    videoBloc = BlocProvider.of<VideoBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: StringResource.videoPickerText)),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingActionButtonPressed,
        child: Icon(Icons.photo_camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocListener(
        bloc: videoBloc,
        listener: (context, state) {
          if (state is VideoAvailableState) {
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<VideoBloc, VideoState>(
          bloc: videoBloc,
          builder: (BuildContext context, VideoState state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (state is VideoAvailableState ||
                        state is VideoPlayingState ||
                        state is VideoPausedState)
                    ? Center(
                        child: Container(
                          height: 350,
                          width: 350,
                          child: Chewie(
                            controller: videoBloc.chewieController,
                          ),
                        ),
                      )
                    : Center(
                        child: CustomText(text: StringResource.noVideoText),
                      ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.IMAGE_HTML_SCREEN);
                  },
                  child: CustomText(
                    text: 'Navigate to html page',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  onFloatingActionButtonPressed() {
    return showDialog(
      context: context,
      builder: (_) => CustomAlertDialog(
        onCameraPressed: () {
          videoBloc.add(VideoFromCameraButtonPressedEvent());
        },
        onGalleryPressed: () {
          videoBloc.add(VideoFromGalleryButtonPressedEvent());
        },
      ),
    );
  }
}
