import 'dart:async';
import 'mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';

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


void main() async {
  AudioService.start(backgroundTaskEntrypoint: musicEntry,
    androidNotificationChannelName: 'Simply Music',
    notificationColor: 0xFF2196f3,
    enableQueue: false,);
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
