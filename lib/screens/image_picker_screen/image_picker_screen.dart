import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_picker/routes.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_picker_screen_bloc.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_picker_screen_event.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_picker_screen_state.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_viewing_screen_bloc.dart';
import 'package:media_picker/utils/color_resource.dart';
import 'package:media_picker/utils/image_resource.dart';
import 'package:media_picker/utils/string_resource.dart';
import 'package:media_picker/widget/common/custom_alert_dialog.dart';
import 'package:media_picker/widget/common/custom_scaffold.dart';
import 'package:media_picker/widget/common/custom_text.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  ImagePickerScreenBloc imageBloc;

  @override
  void initState() {
    imageBloc = BlocProvider.of<ImagePickerScreenBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: CustomText(text: StringResource.imagePickerText),
        backgroundColor: ColorResource.primaryColor.withOpacity(0.8),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingActionButtonPressed,
        child: Icon(Icons.photo_camera),
        backgroundColor: ColorResource.primaryColor.withOpacity(0.8),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocListener<ImagePickerScreenBloc, ImagePickerScreenState>(
        bloc: imageBloc,
        listener: (context, state) {
          if (state is ImagePickerScreenImageAvailableState) {
            Navigator.pop(context);
          }
          if (state is ImagePickerScreenNavigateState) {
            ImageViewArgs args = ImageViewArgs(fileImage: state.image);
            Navigator.pushNamed(
              context,
              AppRoutes.IMAGE_VIEWING_SCREEN,
              arguments: args,
            );
          }
        },
        child: BlocBuilder<ImagePickerScreenBloc, ImagePickerScreenState>(
          bloc: imageBloc,
          builder: (BuildContext context, ImagePickerScreenState state) {
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
                    ? InkWell(
                        onTap: () {
                          imageBloc.add(
                            ImagePickerScreenNavigateEvent(imageBloc.image),
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
          imageBloc.add(ImagePickerScreenCameraButtonPressedEvent());
        },
        onGalleryPressed: () {
          imageBloc.add(ImagePickerScreenGalleryButtonPressedEvent());
        },
      ),
    );
  }
}
