import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_picker/components/custom_alert_dialog.dart';
import 'package:media_picker/components/custom_text.dart';
import 'package:media_picker/screens/video_picker_screen/bloc/video_event.dart';
import 'package:media_picker/utils/image_resource.dart';
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
      appBar: AppBar(
        title: CustomText(text: StringResource.videoPickerText),
        backgroundColor: Colors.red.withOpacity(0.8),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingActionButtonPressed,
        backgroundColor: Colors.red.withOpacity(0.8),
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
              children: <Widget>[
                SizedBox(height: 50),
                CustomText(
                  text: StringResource.captureVideoText,
                  style: GoogleFonts.quicksand(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24),
                (videoBloc.chewieController != null)
                    ? Center(
                        child: Container(
                          height: 350,
                          width: 350,
                          child: Chewie(controller: videoBloc.chewieController),
                        ),
                      )
                    : Center(
                        child: Image.asset(
                          ImageResourse.placeHolder,
                          width: 350,
                          height: 300,
                          fit: BoxFit.cover,
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
        titleText: StringResource.pickAnVideoText,
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
