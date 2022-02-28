import 'package:flutter/material.dart';
import 'package:flutter_web_struct/flutter_web_struct.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var ctrl = WebStructController();
    ctrl.header = Container(
      color: Colors.red,
      child: Center(
        child: Text("This is header"),
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage('Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends WebPage {
  MyHomePage(title) : super(title);

  @override
  Widget largeContent(BuildContext context) {
    // TODO: implement largeContent
    return Container(
      child: Center(
        child: Text(
          "Large content",
        ),
      ),
    );
  }

  @override
  Widget smallContent(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Small content",
        ),
      ),
    );
  }
}
