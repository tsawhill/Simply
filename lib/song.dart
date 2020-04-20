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
                return ListTile(
                  leading: (() {
                    final song = snapshot.data[index];
                    print(song.albumArtwork);
                    if(song.albumArtwork != null)
                      return Image(image: song.albumArtwork);
                    else
                      return Icon(Icons.music_note);
                  }()),
                  title: Text('${snapshot.data[index].title}'),
                  subtitle: Text('${snapshot.data[index].artist}'),
                  onTap: (){
                    playSong('${snapshot.data[index].filePath}', snapshot.data[index].title, snapshot.data[index].album, snapshot.data[index].artist);
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

  Future<void> playSong(String filePath, String title, String artist, String album) async {
    var duration = await player.setFilePath(filePath);
    player.stop();
    player.play();
  }

}

