import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ImageHtmlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String data = """
  <div>
      <h1>Demo Page</h1>
      <p>This is a fantastic nonexistent product that you should buy!</p>
      <h2>Pricing</h2>
      <p>Lorem ipsum <b>dolor</b> sit amet.</p>
      <h2>The Team</h2>
      <p>There isn't <i>really</i> a team...</p>
      <h2>Installation</h2>
      <p>You <u>cannot</u> install a nonexistent product!</p>
      <h2>Image<h2>
      <img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" />
      <!--You can pretty much put any html in here!-->
    </div>
  """;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Html(
            data: data,
            onImageTap: (src) {
              print(src);
            },
          ),
        ),
      ),
    );
  }
}
