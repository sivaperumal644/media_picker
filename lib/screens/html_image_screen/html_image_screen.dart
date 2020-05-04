import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/routes.dart';
import 'package:media_picker/screens/html_image_screen/bloc/html_image_screen_event.dart';
import 'package:media_picker/screens/html_image_screen/bloc/html_image_screen_state.dart';
import 'package:media_picker/screens/image_viewing_screen/bloc/image_viewing_screen_bloc.dart';
import 'package:media_picker/utils/color_resource.dart';
import 'package:media_picker/widget/common/custom_html.dart';
import 'package:media_picker/widget/common/custom_scaffold.dart';
import 'package:media_picker/widget/common/custom_text.dart';
import 'bloc/html_image_screen_bloc.dart';

class ImageHtmlScreen extends StatefulWidget {
  @override
  _ImageHtmlScreenState createState() => _ImageHtmlScreenState();
}

class _ImageHtmlScreenState extends State<ImageHtmlScreen> {
  HtmlImageScreenBloc htmlImageBloc;

  @override
  void initState() {
    htmlImageBloc = BlocProvider.of<HtmlImageScreenBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: CustomText(text: 'HTML Image'),
        backgroundColor: ColorResource.primaryColor.withOpacity(0.8),
      ),
      body: BlocListener(
        bloc: htmlImageBloc,
        listener: (context, state) {
          if (state is HtmlImageButtonPressedState) {
            ImageViewArgs args = ImageViewArgs(stringImage: state.imageSource);
            Navigator.pushNamed(
              context,
              AppRoutes.IMAGE_VIEWING_SCREEN,
              arguments: args,
            );
          }
        },
        child: BlocBuilder<HtmlImageScreenBloc, HtmlImageScreenState>(
          bloc: htmlImageBloc,
          builder: (context, state) {
            return SingleChildScrollView(
              child: CustomHtml(
                padding: EdgeInsets.all(24),
                data: htmlImageBloc.htmlString,
                onImageTap: (source) {
                  htmlImageBloc.add(HtmlImageButtonPressedEvent(source));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
