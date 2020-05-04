import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_viewing_screen_bloc.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_viewing_screen_state.dart';
import 'package:media_picker/widget/common/custom_scaffold.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewingScreen extends StatefulWidget {
  @override
  _ImageViewingScreenState createState() => _ImageViewingScreenState();
}

class _ImageViewingScreenState extends State<ImageViewingScreen> {
  ImageViewingScreenBloc imageViewBloc;

  @override
  void initState() {
    imageViewBloc = BlocProvider.of<ImageViewingScreenBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageViewingScreenBloc, ImageViewingScreenState>(
      bloc: imageViewBloc,
      builder: (context, state) {
        return CustomScaffold(
          appBar: AppBar(backgroundColor: Colors.black),
          body: Container(
            constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height),
            child: PhotoView(
              imageProvider: (imageViewBloc.fileImage != null)
                  ? FileImage(imageViewBloc.fileImage)
                  : NetworkImage(imageViewBloc.stringImage),
            ),
          ),
        );
      },
    );
  }
}
