import 'package:flemme/flemme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_struct/src/responsive_widget.dart';

import 'material_web_app.dart';

enum TypePage { SCROLLVIEW, FULLCONTENT }

abstract class WebPage extends StatelessWidget {
  WebPage(this.title, {this.typePage = TypePage.SCROLLVIEW}) : super();

  late String title;
  late TypePage typePage;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: largeScreen(context),
      smallScreen: smallScreen(context),
    );
  }

  Scaffold largeScreen(BuildContext context) {
    return Scaffold(
      body: [
        webStructController.header ?? SizedBox(),
        typePage == TypePage.SCROLLVIEW
            ? SingleChildScrollView(
                child: [
                  largeContent(context),
                  webStructController.footer ?? SizedBox()
                ].listToColumn(),
              ).withExpanded()
            : [
                largeContent(context).withExpanded(),
                webStructController.footer ?? SizedBox()
              ].listToColumn(),
      ].listToColumn(),
    );
  }

  Scaffold smallScreen(BuildContext context) {
    return Scaffold(
      appBar: webStructController.appBar ??
          AppBar(
            title: Text(title),
            // backgroundColor: Colors.white24,
          ),
      drawer: webStructController.drawer,
      body: SingleChildScrollView(
        child: [smallContent(context), webStructController.footer ?? SizedBox()]
            .listToColumn(),
      ),
    );
  }

  Widget largeContent(BuildContext context);
  Widget mediumContent(BuildContext context);
  Widget smallContent(BuildContext context);
}
