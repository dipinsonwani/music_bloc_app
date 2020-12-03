
import 'dart:convert';

import 'package:http/http.dart';

class Song {
  final String songName;
  final String artist;
  final String album;

  Song({this.songName, this.artist, this.album});

  Future<void> getList() async {
    Response response = await get('https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7');
    Map data = jsonDecode(response.body);
    print(data);
  }
}
