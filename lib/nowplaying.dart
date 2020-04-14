import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:simply_music/mainscreen.dart';

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
        StreamBuilder<MediaItem>(
          stream: AudioService.currentMediaItemStream,
          builder: (context, snapshot) {
            final screenState = snapshot.data;
            if(!snapshot.hasData){
              return Container(child: Text('No song playing'));
            }
            else{
              return Container(
                child: Text('$screenState.title'),
              );
            }
          },
        )
        ]
    );
  }
}