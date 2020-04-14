import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';


void main() async {
  AudioService.start(backgroundTaskEntrypoint: musicEntry,
    androidNotificationChannelName: 'Simply Music',
    notificationColor: 0xFF2196f3,
    enableQueue: true,);

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

void musicEntry() async{
  AudioServiceBackground.run(() => AudioPlayerTask());
}

class AudioPlayerTask extends BackgroundAudioTask {
  final audioPlayer = AudioPlayer();
  final completer = Completer();

  @override
  Future<void> onStart() async {
    await completer.future;
  }

  @override
  void onStop() {
    audioPlayer.stop();
    completer.complete();
  }

}