import 'package:flutter/material.dart';
import 'package:music_app/song.dart';

class MusicPage extends StatefulWidget {
  
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {

  
  List<Song> songs = [
    Song(songName: 'Popstar', artist: 'Rockstar', album: 'Trevor'),
    Song(songName: 'Danza Kuduro', artist: 'Don Omar', album: 'Don Omar'),
    Song(
        songName: 'Paradise', artist: 'George Ezra', album: 'Staying at Tamara')
  ];
  void getSongs(){
    Map data = ModalRoute.of(context).settings.arguments;
    print(data);

  }
  @override
  void initState(){
    super.initState();
    Song s;
    s.getList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trending Music"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
                      child: ListTile(
              title: Text(songs[index].songName),
              leading: Icon(Icons.music_note),
              subtitle: Text(songs[index].artist),
            ),
          );
        },
        itemCount: songs.length,

      ),
    );
  }
}
