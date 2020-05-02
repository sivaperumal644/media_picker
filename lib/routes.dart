import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/screens/image_picker_screen/bloc/image_bloc.dart';
import 'package:media_picker/screens/image_picker_screen/image_picker_screen.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_view_bloc.dart';
import 'package:media_picker/screens/image_viewing_screen/image_viewing_screen.dart';
import 'package:media_picker/screens/video_picker_screen/bloc/video_bloc.dart';
import 'package:media_picker/screens/video_picker_screen/video_picker_screen.dart';

class AppRoutes {
  static const String IMAGE_PICKER_SCREEN = 'image_picker_screen';
  static const String VIDEO_PICKER_SCREEN = 'video_picker_screen';
  static const String IMAGE_VIEWING_SCREEN = 'image_viewing_screen';
}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.IMAGE_PICKER_SCREEN:
      return buildImagePickerScreen();
    case AppRoutes.VIDEO_PICKER_SCREEN:
      return buildVideoPickerScreen();
    case AppRoutes.IMAGE_VIEWING_SCREEN:
      return buildImageViewingScreen(settings);
  }
}

class PageBuilder {
  static Widget buildImagePickerScreenPage() {
    return BlocProvider<ImageBloc>(
      create: (context) {
        return ImageBloc();
      },
      child: ImagePickerScreen(),
    );
  }

  static Widget buildVideoPickerScreenPage() {
    return BlocProvider<VideoBloc>(
      create: (context) {
        return VideoBloc();
      },
      child: VideoPickerScreen(),
    );
  }

  static Widget buildImageViewerScreenPage(RouteSettings settings) {
    return BlocProvider<ImageViewBloc>(
      create: (context) {
        ImageViewArgs args = settings.arguments;
        return ImageViewBloc(args);
      },
      child: ImageViewingScreen(),
    );
  }
}

buildVideoPickerScreen() {
  return MaterialPageRoute(
    builder: (context) => PageBuilder.buildVideoPickerScreenPage(),
  );
}

buildImagePickerScreen() {
  return MaterialPageRoute(
    builder: (context) => PageBuilder.buildImagePickerScreenPage(),
  );
}

buildImageViewingScreen(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => PageBuilder.buildImageViewerScreenPage(settings),
  );
}
