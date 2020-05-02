import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/components/custom_alert_dialog.dart';
import 'package:media_picker/components/custom_text.dart';
import 'package:media_picker/routes.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_bloc.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_event.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_state.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_view_bloc.dart';
import 'package:media_picker/utils/string_resource.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  ImageBloc imageBloc;

  @override
  void initState() {
    imageBloc = BlocProvider.of<ImageBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: StringResource.imagePickerText)),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingActionButtonPressed,
        child: Icon(Icons.photo_camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocListener<ImageBloc, ImageState>(
        bloc: imageBloc,
        listener: (context, state) {
          if (state is VideoNavigateState) {
            Navigator.pushNamed(
              context,
              AppRoutes.VIDEO_PICKER_SCREEN,
            );
          }
          if (state is ImageAvailableState) {
            Navigator.pop(context);
          }
          if (state is ImageViewNavigateState) {
            ImageViewArgs args = ImageViewArgs(state.image);
            Navigator.pushNamed(
              context,
              AppRoutes.IMAGE_VIEWING_SCREEN,
              arguments: args,
            );
          }
        },
        child: BlocBuilder<ImageBloc, ImageState>(
          bloc: imageBloc,
          builder: (BuildContext context, ImageState state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (imageBloc.image != null)
                    ? GestureDetector(
                        onTap: () {
                          imageBloc.add(
                            ImageViewNavigateEvent(imageBloc.image),
                          );
                        },
                        child: Center(
                          child: Image.file(
                            imageBloc.image,
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Center(
                        child: CustomText(text: StringResource.noImageText),
                      ),
                SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {
                    imageBloc.add(NavigateButtonPressedEvent());
                  },
                  child: CustomText(text: StringResource.movieToVideoText),
                )
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
          imageBloc.add(ImageFromCameraButtonPressedEvent());
        },
        onGalleryPressed: () {
          imageBloc.add(ImageFromGalleryButtonPressedEvent());
        },
      ),
    );
  }
}
