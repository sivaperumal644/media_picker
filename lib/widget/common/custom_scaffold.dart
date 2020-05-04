import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  AppBar appBar;
  Widget body;
  FloatingActionButton floatingActionButton;
  FloatingActionButtonLocation floatingActionButtonLocation;
  Color backgroundColor;
  Widget drawer;
  CustomScaffold({
    this.appBar,
    this.body,
    this.drawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      drawer: drawer,
      backgroundColor: backgroundColor,
    );
  }
}
