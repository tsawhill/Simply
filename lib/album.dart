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
                      return FlatButton(
                        child: Text('${snapshot.data[index].title}'),
                        onPressed: () {

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