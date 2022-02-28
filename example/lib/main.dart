import 'package:flutter/material.dart';
import 'package:flutter_web_struct/flutter_web_struct.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var ctrl = WebStructController();
    ctrl.header = Container(
      color: Colors.red,
      height: 48,
      child: const Center(
        child: Text("This is header"),
      ),
    );
    ctrl.footer = Container(
      color: Colors.white,
      height: 24,
      child: const Center(
        child: Text(
          "This is footer",
        ),
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
  MyHomePage(title) : super(title, typePage: TypePage.FULLCONTENT);

  @override
  Widget largeContent(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          "Large content",
        ),
      ),
    );
  }

  @override
  Widget smallContent(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          "Small content",
        ),
      ),
    );
  }

  @override
  Widget mediumContent(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: const Center(
        child: Text(
          "Medium content",
        ),
      ),
    );
  }
}
