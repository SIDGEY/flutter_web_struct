import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

String webStructUrlBase = "https://www.";
int webStructLargePage = 1200;
int webStructMediumPage = 800;

WebStructController webStructController = WebStructController();

enum TypePage { SCROLLVIEW, FULLCONTENT }
enum TypeMenu { DRAWER, HEADER }

class WebStructController {
  static final WebStructController _singleton = WebStructController._internal();

  factory WebStructController() {
    return _singleton;
  }

  WebStructController._internal();

  String webStructUrlBase = "https://www.";
  int webStructLargePage = 1200;
  int webStructMediumPage = 800;

  // bool withMedium = false;

  Widget? footer;

  Widget? header;

  Drawer? drawer;

  AppBar? appBar;
}
