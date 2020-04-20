import 'package:flutter/material.dart';
import 'album.dart';
import 'settings.dart';
import 'song.dart';
import 'artist.dart';
import 'nowplaying.dart';


class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {

  int _selectedPage = 3;
  final _pages = [
    AlbumPage(),
    ArtistsPage(),
    NowPlaying(),
    SongsPage(),
  ];

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Simply Music',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simply Music'),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry> [
                  PopupMenuItem(
                    child: FlatButton(
                      child: Text('Settings'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SettingsPage()));
                        print('Bruh');
                    },
                    ),
                  ),
                ];
              }
            )

          ]

        ),
        body: _pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.album),
                title: Text('Albums')
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.mic),
                title: Text('Artists')
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.play_arrow),
                title: Text('Now Playing')
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.music_note),
                title: Text('Songs')
            ),
          ],
        ),
      ),
    );
  }
}

