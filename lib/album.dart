import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class AlbumPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AlbumPageState();
  }
}
class AlbumPageState extends State<AlbumPage> {
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
                        leading: (() {
                          final album = snapshot.data[index];
                          print(album.albumArt);
                          if(album.albumArt != null)
                            return Image(image: album.albumArt);
                          else
                            return Icon(Icons.album);
                        }()),
                        title: Text('${snapshot.data[index].title}'),
                        onTap: () {

                        },


                      );
                    }
                )
            );
        }
    );
  }

  Future<List> getAlbums() async {
    return audioQuery.getAlbums();
  }
}