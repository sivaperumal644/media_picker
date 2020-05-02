import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_view_bloc.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_view_state.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewingScreen extends StatefulWidget {
  @override
  _ImageViewingScreenState createState() => _ImageViewingScreenState();
}

class _ImageViewingScreenState extends State<ImageViewingScreen> {
  ImageViewBloc imageViewBloc;

  @override
  void initState() {
    imageViewBloc = BlocProvider.of<ImageViewBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageViewBloc, ImageViewState>(
      bloc: imageViewBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.black),
          body: Container(
            constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height),
            child: PhotoView(imageProvider: FileImage(imageViewBloc.image)),
          ),
        );
      },
    );
  }
}
