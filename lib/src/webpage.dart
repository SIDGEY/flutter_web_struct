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
      mediumScreen: mediumScreen(context),
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
                  webStructController.footer ?? const SizedBox()
                ].listToColumn(),
              ).withExpanded()
            : [
                largeContent(context).withFlexible(),
                webStructController.footer ?? const SizedBox()
              ].listToColumn().withExpanded(),
      ].listToColumn(),
    );
  }

  Scaffold mediumScreen(BuildContext context) {
    return Scaffold(
      body: [
        webStructController.header ?? SizedBox(),
        typePage == TypePage.SCROLLVIEW
            ? SingleChildScrollView(
                child: [
                  mediumContent(context),
                  webStructController.footer ?? const SizedBox()
                ].listToColumn(),
              ).withExpanded()
            : [
                mediumContent(context).withFlexible(),
                webStructController.footer ?? const SizedBox()
              ].listToColumn().withExpanded(),
      ].listToColumn(),
    );
  }

  Scaffold smallScreen(BuildContext context) {
    return Scaffold(
      appBar: webStructController.appBar ??
          AppBar(
            title: Text(title),
          ),
      drawer: webStructController.drawer,
      body: [
        typePage == TypePage.SCROLLVIEW
            ? SingleChildScrollView(
                child: [
                  smallContent(context),
                  webStructController.footer ?? const SizedBox()
                ].listToColumn(),
              ).withExpanded()
            : [
                smallContent(context).withFlexible(),
                webStructController.footer ?? const SizedBox()
              ].listToColumn().withExpanded(),
      ].listToColumn(),
    );
  }

  Widget largeContent(BuildContext context);
  Widget mediumContent(BuildContext context);
  Widget smallContent(BuildContext context);
}
