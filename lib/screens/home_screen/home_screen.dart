import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_picker/routes.dart';
import 'package:media_picker/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:media_picker/screens/home_screen/bloc/home_screen_event.dart';
import 'package:media_picker/screens/home_screen/bloc/home_screen_state.dart';
import 'package:media_picker/utils/color_resource.dart';
import 'package:media_picker/utils/image_resource.dart';
import 'package:media_picker/utils/string_resource.dart';
import 'package:media_picker/widget/common/custom_image.dart';
import 'package:media_picker/widget/common/custom_scaffold.dart';
import 'package:media_picker/widget/common/custom_text.dart';
import 'package:media_picker/widget/common/primary_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenBloc homeScreenBloc;

  @override
  void initState() {
    homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.white,
      body: BlocListener(
        bloc: homeScreenBloc,
        listener: (context, state) {
          if (state is HomeScreenImageButtonPressedState) {
            Navigator.pushNamed(context, AppRoutes.IMAGE_PICKER_SCREEN);
          }
          if (state is HomeScreenVideoButtonPressedState) {
            Navigator.pushNamed(context, AppRoutes.VIDEO_PICKER_SCREEN);
          }
          if (state is HomeScreenHtmlImageButtonPressedState) {
            Navigator.pushNamed(context, AppRoutes.IMAGE_HTML_SCREEN);
          }
        },
        child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          bloc: homeScreenBloc,
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomImage(
                    image: ImageResourse.cameraImage,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  CustomText(
                    text: StringResource.mediaPickerText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 36,
                      color: ColorResource.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 4),
                  CustomText(
                    text: StringResource.pickMediaText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 50),
                  PrimaryButton(
                    buttonText: StringResource.imagePickerText,
                    onPressed: () {
                      homeScreenBloc.add(HomeScreenImageButtonPressedEvent());
                    },
                  ),
                  SizedBox(height: 24),
                  PrimaryButton(
                    buttonText: StringResource.videoPickerText,
                    onPressed: () {
                      homeScreenBloc.add(HomeScreenVideoButtonPressedEvent());
                    },
                  ),
                  SizedBox(height: 24),
                  PrimaryButton(
                    buttonText: StringResource.htmlImageText,
                    onPressed: () {
                      homeScreenBloc
                          .add(HomeScreenHtmlImageButtonPressedEvent());
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
