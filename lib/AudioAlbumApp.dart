import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:my_project/PlaySongPage.dart';

void main() {
  runApp(AudioAlbumApp());
}

class AudioAlbumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AudioAlbumPage(),
    );
  }
}

class AudioAlbumPage extends StatelessWidget {
  final List<String> songs = [
    "Song 1",
    "Song 2",
    "Song 3",
    // Add more song names here
  ];

  final List<String> songUrls = [
    "https://music.youtube.com/watch?v=F7tRt7EuPJQ&si=wDWH5_015Azh7lnT",
    "https://prosearch.tribeofnoise.com/artists/show/80880/39654",
    "https://prosearch.tribeofnoise.com/artists/show/80880/39654",
    " https://prosearch.tribeofnoise.com/artists/show/80880/39654",
    // Add more song URLs here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio Album"),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(songs[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaySongPage(
                    songName: songs[index],
                    songUrl: songUrls[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
