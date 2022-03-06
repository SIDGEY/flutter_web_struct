import 'package:flemme/flemme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../flutter_web_struct.dart';

enum TypePage { SCROLLVIEW, FULLCONTENT }
enum TypeMenu { DRAWER, HEADER }

abstract class MobilePage extends StatelessWidget {
  MobilePage(this.title, {this.typePage = TypePage.SCROLLVIEW}) : super();

  late String title;
  late TypePage typePage;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: largeScreen(context),
      smallScreen: smallScreen(context),
      mediumScreen: largeScreen(context),
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
              // backgroundColor: Colors.white24,
            ),
        drawer: webStructController.drawer,
        body: /* typePage == TypePage.SCROLLVIEW
          ?
      */
            SingleChildScrollView(
          child: [
            smallContent(context),
            webStructController.footer ?? const SizedBox()
          ].listToColumn(),
        )
        /* : [
              smallContent(context).withFlexible(),
              webStructController.footer ?? SizedBox()
            ].listToColumn().withExpanded(),
      */
        );
  }

  Widget largeContent(BuildContext context);
  Widget mediumContent(BuildContext context);
  Widget smallContent(BuildContext context);
}
