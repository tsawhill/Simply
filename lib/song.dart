import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';


class SongsPage extends StatelessWidget {
  final audioQuery = FlutterAudioQuery();
  _backgroundTaskEntrypoint() {
    AudioServiceBackground.run(() => AudioPlayerTask());
  }


  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: getSongs(),
      builder: (context, AsyncSnapshot snapshot){
        if(!snapshot.hasData){
          return Center(child: Text('No songs found!'));
        }
        else
          return Container(
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return FlatButton(

                  child: Text('${snapshot.data[index].title}'),
                  onPressed: (){
                    AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint());
                    print(Text('${snapshot.data[index].title}'));
                    print('${snapshot.data[index].filePath}');
                  }
                );
              }
            )
          );
      }
    );
  }



  Future<List> getSongs() async{
    return audioQuery.getSongs();
  }


  void playSong(String filePath){
    AudioPlayer().setFilePath(filePath);
    AudioPlayer().play();
  }

}
class AudioPlayerTask extends BackgroundAudioTask {
  final audioPlayer = AudioPlayer();
  final completer = Completer();

  @override
  Future<void> onStart() async {
    await audioPlayer.setFilePath('/storage/emulated/0/Music/A Day to Remember/A Day to Remember - What Separates Me From You/A Day to Remember - All I Want.mp3');
    audioPlayer.play();
    await completer.future;
  }

  @override
  void onStop() {
    audioPlayer.stop();
    completer.complete();
  }

}
