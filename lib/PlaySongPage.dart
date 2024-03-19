import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlaySongPage extends StatefulWidget {
  final String songName;
  final String songUrl;

  PlaySongPage({required this.songName, required this.songUrl});

  @override
  _PlaySongPageState createState() => _PlaySongPageState();
}

class _PlaySongPageState extends State<PlaySongPage> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initPlayer();
  }

  _initPlayer() async {
    try {
      await _audioPlayer.setUrl(widget.songUrl);
      _audioPlayer.play();
    } catch (e, stacktrace) {
      print("Error: $e");
      print("Stacktrace: $stacktrace");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.songName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Now Playing: ${widget.songName}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to Album"),
            ),
          ],
        ),
      ),
    );
  }
}
