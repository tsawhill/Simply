import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:simply_music/albumsbyartist.dart';

class ArtistsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ArtistPageState();
  }
}
class ArtistPageState extends State<ArtistsPage> {
  final audioQuery = FlutterAudioQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAlbums(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('No songs found!'));
          }
          else
            return Container(
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(Icons.mic),
                        title: Text('${snapshot.data[index].name}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AlbumsByArtist(artist: '${snapshot.data[index].name}')),
                          );
                        },


                      );
                    }
                )
            );
        }
    );
  }

  Future<List> getAlbums() async {
    return audioQuery.getArtists();
  }
}