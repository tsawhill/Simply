import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';


class SongsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SongsPageState();
  }
}

class SongsPageState extends State<SongsPage> {
  final audioQuery = FlutterAudioQuery();

  final player = AudioPlayer();



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
                    playSong('${snapshot.data[index].filePath}');
                  },


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

  Future<void> playSong(String filePath) async {
    var duration = await player.setFilePath(filePath);
    player.play();
  }

}

