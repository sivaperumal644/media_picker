import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_picker/components/custom_text.dart';
import 'package:media_picker/components/primary_button.dart';
import 'package:media_picker/routes.dart';
import 'package:media_picker/screens/home_screen/bloc/home_bloc.dart';
import 'package:media_picker/screens/home_screen/bloc/home_event.dart';
import 'package:media_picker/screens/home_screen/bloc/home_state.dart';
import 'package:media_picker/utils/image_resource.dart';
import 'package:media_picker/utils/string_resource.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is HomeImageButtonPressedState) {
            Navigator.pushNamed(context, AppRoutes.IMAGE_PICKER_SCREEN);
          }
          if (state is HomeVideoButtonPressedState) {
            Navigator.pushNamed(context, AppRoutes.VIDEO_PICKER_SCREEN);
          }
          if (state is HomeHtmlImageButtonPressedState) {
            Navigator.pushNamed(context, AppRoutes.IMAGE_HTML_SCREEN);
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: homeBloc,
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    ImageResourse.cameraImage,
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
                      color: Colors.red,
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
                      homeBloc.add(HomeImageButtonPressedEvent());
                    },
                  ),
                  SizedBox(height: 24),
                  PrimaryButton(
                    buttonText: StringResource.videoPickerText,
                    onPressed: () {
                      homeBloc.add(HomeVideoButtonPressedEvent());
                    },
                  ),
                  SizedBox(height: 24),
                  PrimaryButton(
                    buttonText: StringResource.htmlImageText,
                    onPressed: () {
                      homeBloc.add(HomeHtmlImageButtonPressedEvent());
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
