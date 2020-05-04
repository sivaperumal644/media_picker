import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_picker/screens/video_picker_screen/bloc/video_picker_screen_bloc.dart';
import 'package:media_picker/screens/video_picker_screen/bloc/video_picker_screen_event.dart';
import 'package:media_picker/screens/video_picker_screen/bloc/video_picker_screen_state.dart';
import 'package:media_picker/utils/color_resource.dart';
import 'package:media_picker/utils/image_resource.dart';
import 'package:media_picker/utils/string_resource.dart';
import 'package:media_picker/widget/common/custom_alert_dialog.dart';
import 'package:media_picker/widget/common/custom_image.dart';
import 'package:media_picker/widget/common/custom_scaffold.dart';
import 'package:media_picker/widget/common/custom_text.dart';

class VideoPickerScreen extends StatefulWidget {
  @override
  _VideoPickerScreenState createState() => _VideoPickerScreenState();
}

class _VideoPickerScreenState extends State<VideoPickerScreen> {
  VideoPickerScreenBloc videoBloc;

  @override
  void initState() {
    super.initState();
    videoBloc = BlocProvider.of<VideoPickerScreenBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    videoBloc.chewieController.dispose();
    videoBloc.videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: CustomText(text: StringResource.videoPickerText),
        backgroundColor: ColorResource.primaryColor.withOpacity(0.8),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingActionButtonPressed,
        backgroundColor: ColorResource.primaryColor.withOpacity(0.8),
        child: Icon(Icons.photo_camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocListener(
        bloc: videoBloc,
        listener: (context, state) {
          if (state is VideoPickerScreenVideoAvailableState) {
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<VideoPickerScreenBloc, VideoPickerScreenState>(
          bloc: videoBloc,
          builder: (BuildContext context, VideoPickerScreenState state) {
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
                (videoBloc.videoFile != null)
                    ? Center(
                        child: Container(
                          height: 350,
                          width: 350,
                          child: Chewie(controller: videoBloc.chewieController),
                        ),
                      )
                    : Center(
                        child: CustomImage(
                          image: ImageResourse.placeHolder,
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
          videoBloc.add(VideoPickerScreenCameraButtonPressedEvent());
        },
        onGalleryPressed: () {
          videoBloc.add(VideoPickerScreenGalleryButtonPressedEvent());
        },
      ),
    );
  }
}
