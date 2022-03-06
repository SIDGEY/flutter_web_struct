import 'package:flemme/flemme.dart';
import 'package:flutter/material.dart';

import '../flutter_web_struct.dart';

abstract class MobilePage extends StatelessWidget {
  const MobilePage(this.title,
      {this.typePage = TypePage.SCROLLVIEW,
      this.typeMenu = TypeMenu.DRAWER,
      Key? key})
      : super(key: key);

  final String title;
  final TypePage typePage;
  final TypeMenu typeMenu;

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
      drawer: typeMenu == TypeMenu.DRAWER ? webStructController.drawer : null,
      body: [
        typeMenu == TypeMenu.HEADER
            ? (webStructController.header ?? const SizedBox())
            : const SizedBox(),
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
  Widget smallContent(BuildContext context);
}
