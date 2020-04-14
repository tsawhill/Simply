import 'package:shared_preferences/shared_preferences.dart';
import 'mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';


void main() => runApp(MyApp());


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
      title: 'Audio Service',
      theme: ThemeData.dark(),
      home: AudioServiceWidget(child: MainScreen()),
    );
  }
}

Future<bool> getBool(String x) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(x);
}

Future<int> getInt(String x) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(x);
}

