import 'package:flutter/material.dart';
import 'package:flutter_web_struct/flutter_web_struct.dart';

// ignore: must_be_immutable
class ResponsiveWidget extends StatefulWidget {
  late Widget largeScreen;
  Widget? mediumScreen;
  Widget? smallScreen;

  ResponsiveWidget(
      {required this.largeScreen,
      this.mediumScreen,
      this.smallScreen,
      Key? key})
      : super(key: key);

  @override
  _ResponsiveWidgetState createState() => _ResponsiveWidgetState();

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >
        webStructController.webStructLargePage;
  }

  //Small screen is any screen whose width is less than 800 pixels
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width <
        webStructController.webStructMediumPage;
  }

  //Medium screen is any screen whose width is less than 1200 pixels,
  //and more than 800 pixels
  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >
            webStructController.webStructMediumPage &&
        MediaQuery.of(context).size.width <
            webStructController.webStructLargePage;
  }
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> {
  @override
  Widget build(BuildContext context) {
    //Returns the widget which is more appropriate for the screen size
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webStructController.webStructLargePage) {
        return widget.largeScreen;
      } else if (constraints.maxWidth >
              webStructController.webStructMediumPage &&
          constraints.maxWidth < webStructController.webStructLargePage) {
        //if medium screen not available, then return large screen
        return widget.mediumScreen ?? widget.largeScreen;
      } else {
        //if small screen implementation not available, then return large screen
        return widget.smallScreen ?? widget.largeScreen;
      }
    });
  }
}
