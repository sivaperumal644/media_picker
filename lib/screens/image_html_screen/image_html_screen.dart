import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:media_picker/components/custom_text.dart';
import 'package:media_picker/routes.dart';
import 'package:media_picker/screens/image_html_screen/bloc/image_html_bloc.dart';
import 'package:media_picker/screens/image_html_screen/bloc/image_html_event.dart';
import 'package:media_picker/screens/image_html_screen/bloc/image_html_state.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_view_bloc.dart';

class ImageHtmlScreen extends StatefulWidget {
  @override
  _ImageHtmlScreenState createState() => _ImageHtmlScreenState();
}

class _ImageHtmlScreenState extends State<ImageHtmlScreen> {
  ImageHtmlBloc imageHtmlBloc;
  String data = """
  <div>
      <h1>Image from HTML</h1>
      <img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" />
      <!--You can pretty much put any html in here!-->
    </div>
  """;

  @override
  void initState() {
    imageHtmlBloc = BlocProvider.of<ImageHtmlBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'HTML Image',
        ),
      ),
      body: BlocListener(
        bloc: imageHtmlBloc,
        listener: (context, state) {
          if (state is ImageHtmlButtonPressedState) {
            ImageViewArgs args = ImageViewArgs(imageString: state.imgSrc);
            Navigator.pushNamed(
              context,
              AppRoutes.IMAGE_VIEWING_SCREEN,
              arguments: args,
            );
          }
        },
        child: BlocBuilder<ImageHtmlBloc, ImageHtmlState>(
          bloc: imageHtmlBloc,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Center(
                child: Html(
                  padding: EdgeInsets.all(24),
                  data: data,
                  onImageTap: (src) {
                    imageHtmlBloc.add(ImageHtmlButtonPressedEvent(src));
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
