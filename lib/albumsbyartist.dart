import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'songbyalbum.dart';

class AlbumsByArtist extends StatelessWidget {
  final String artist;
  AlbumsByArtist({Key key, @required this.artist}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
        title: artist,
        theme: ThemeData.dark(),
        home: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => Navigator.pop(context)),
           title: Text(artist),
           centerTitle: true,
        ),
          body:FutureBuilder(
            future: getAlbums(artist),
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
                              final album = snapshot.data[index];
                              if(album.albumArt != null)
                                return Image(image: album.albumArt);
                              else
                                return Icon(Icons.album);
                            }()),
                            title: Text('${snapshot.data[index].title}'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SongByAlbum(album: '${snapshot.data[index].id}', albumName: '${snapshot.data[index].title}')));

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
  Future<List> getAlbums(artist){
    final audioQuery = FlutterAudioQuery();
    return audioQuery.getAlbumsFromArtist(artist: artist);
  }
}

