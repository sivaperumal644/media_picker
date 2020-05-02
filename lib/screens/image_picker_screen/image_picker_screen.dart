import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_picker/components/custom_alert_dialog.dart';
import 'package:media_picker/components/custom_text.dart';
import 'package:media_picker/routes.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_bloc.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_event.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_state.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_view_bloc.dart';
import 'package:media_picker/utils/image_resource.dart';
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
      appBar: AppBar(
        title: CustomText(text: StringResource.imagePickerText),
        backgroundColor: Colors.red.withOpacity(0.8),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingActionButtonPressed,
        child: Icon(Icons.photo_camera),
        backgroundColor: Colors.red.withOpacity(0.8),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocListener<ImageBloc, ImageState>(
        bloc: imageBloc,
        listener: (context, state) {
          if (state is ImageAvailableState) {
            Navigator.pop(context);
          }
          if (state is ImageViewNavigateState) {
            ImageViewArgs args = ImageViewArgs(image: state.image);
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
              children: <Widget>[
                SizedBox(height: 50),
                CustomText(
                  text: StringResource.captureImageText,
                  style: GoogleFonts.quicksand(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24),
                (imageBloc.image != null)
                    ? GestureDetector(
                        onTap: () {
                          imageBloc.add(
                            ImageViewNavigateEvent(imageBloc.image),
                          );
                        },
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 8.0,
                                  offset: Offset(1, 4),
                                )
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.file(
                                imageBloc.image,
                                width: 350,
                                height: 350,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
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
        titleText: StringResource.pickAnImageText,
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
