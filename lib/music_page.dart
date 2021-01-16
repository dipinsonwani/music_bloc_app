import 'package:flutter/material.dart';
import 'package:music_app/song.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  var s;
  List<Song> songs = [
    // Song(songName: 'Popstar', artist: 'Rockstar', album: 'Trevor'),
    // Song(songName: 'Danza Kuduro', artist: 'Don Omar', album: 'Don Omar'),
    // Song(
    //     songName: 'Paradise', artist: 'George Ezra', album: 'Staying at Tamara')
  ];
  Future<void> getList() async {
    var response = await http.get(
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7');
    var data = json.decode(response.body) as Map<String, dynamic>;
    List<Song> loadedSongs = [];

    data.forEach((key, value) {

      (value['body']['track_list'] as List<dynamic>).map((item) {
        loadedSongs.add(Song(
            songName: item['track']['track_name'],
            album: item['track']['album_name'],
            artist: item['track']['artist_name']));
        print(item['track']['song_name']);
      }).toList();

    });
    setState(() {
      songs = loadedSongs;
    });
    
    print(songs[0].songName);
  }


  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trending Music"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                songs;
              });
            },
          )
        ],
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
