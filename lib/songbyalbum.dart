import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:audio_service/audio_service.dart';
import 'song.dart';
import 'package:just_audio/just_audio.dart';

class SongByAlbum extends StatelessWidget {
  final player = AudioPlayer();
  final String albumName;
  final String album;
  SongByAlbum({Key key, @required this.album, @required this.albumName}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
        title: album,
        theme: ThemeData.dark(),
        home: Scaffold(
            appBar: AppBar(
              leading: BackButton(onPressed: () => Navigator.pop(context)),
              title: Text(albumName),
              centerTitle: true,
            ),
            body:FutureBuilder(
                future: getSongs(album),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('No albums found!'));
                  }
                  else
                    return Container(
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: (() {
                                  final song = snapshot.data[index];
                                  if(song.albumArtwork != null)
                                    return Image(image: song.albumArtwork);
                                  else
                                    return Icon(Icons.music_note);
                                }()),
                                title: Text('${snapshot.data[index].title}'),
                                onTap: () {
                                  SongsPageState.playSong('${snapshot.data[index].filePath}', snapshot.data[index].title, snapshot.data[index].album, snapshot.data[index].artist);
                                },


                              );
                            }
                        )
                    );
                }
            )
        )
    );

  }
  Future<List> getSongs(album){
    final audioQuery = FlutterAudioQuery();
    return audioQuery.getSongsFromAlbum(albumId: album);
  }

}

