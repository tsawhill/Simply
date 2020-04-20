import 'package:flutter/material.dart';

class NowPlaying extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NowPlayingState();
  }
}

class NowPlayingState extends State<NowPlaying> {
  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        /*StreamBuilder<MediaItem>(
          stream: AudioService.currentMediaItemStream,
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return Text('Title: ${snapshot.data?.title}');
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return Text('Loading title...');

          },
        )

         */
        Text('Currently not working. In my free time I am going to be rebuilding the whole app from the ground up, adding support for this feature.'),
        ]
    );
  }
}