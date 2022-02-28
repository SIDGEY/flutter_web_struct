# flutter_web_struct
Package for help developper to make a nice website!

## Installation
Add `flutter_web_struct` as a dependency in your pubspec.yaml file.

```yaml
dependencies:
flutter_web_struct: ^0.0.1
```

## Usage
For use flutter_web_struct by following steps : 

```dart
// Import the plugin
import 'package:flutter_web_struct/flutter_web_struct.dart';

// call initialisation in main 
void main() async {
  runApp(const MyApp());
} 
```

Call WebStructController and configure your Design


```dart
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    var ctrl = WebStructController();
    //Configure Base Url if you need
    ctrl.webStructUrlBase = "http://www.mywebsite.com";

    // this is header
    ctrl.header = Container(
      color: Colors.red,
      height: 48,
      child: const Center(
        child: Text("This is header"),
      ),
    );
 // this is footer
    ctrl.footer = Container(
      color: Colors.white,
      height: 24,
      child: const Center(
        child: Text(
          "This is footer",
        ),
      ),
    );
    
    //you can manage your MaterialApp as you want, with your RouteManager

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

```

Create your page  extends WebPage
```dart

class MyHomePage extends WebPage {
// Choose FULLCONTENT or SCROLLVIEW (defaut ScrollView)
  MyHomePage(title) : super(title, typePage: TypePage.FULLCONTENT);

//Complet your design for Large screen
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

//Complet your design for Small screen

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

//Complet your design for Medium screen
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

```


Configure your screen 
```dart
    ctrl.webStructLargePage = 1200; //default value
    ctrl.webStructMediumPage = 800; //default value
```