import 'mainscreen.dart';
import 'package:flutter/material.dart';



void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simply Music',
      theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}
