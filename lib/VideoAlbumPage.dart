import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(VideoAlbumPage(
    videos: [],
  ));
}

class VideoAlbumPage extends StatelessWidget {
  final List<VideoData> videos;

  VideoAlbumPage({required this.videos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Album'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return ListTile(
            leading: Image.network(video.thumbnail),
            title: Text(video.title),
            onTap: () {
              if (video.link != null) {
                _playVideo(context, video.link!);
              }
            },
          );
        },
      ),
    );
  }

  void _playVideo(BuildContext context, String videoLink) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(videoLink: videoLink),
      ),
    );
  }
}

class VideoData {
  final String title;
  final String thumbnail;
  final String? link; // Use a nullable String

  VideoData({required this.title, required this.thumbnail, this.link});
}

// Usage example:
VideoData video1 = VideoData(
  title: 'Lal gaghra',
  thumbnail: 'https://via.placeholder.com/800x600/FFD700/000000?text=Beach',
  link: 'https://youtu.be/qZId59qml_4?si=qpnwBxcCS4jNXl3E',
);

VideoData video2 = VideoData(
  title: 'Rasgulla',
  thumbnail: 'https://via.placeholder.com/800x600/87CEEB/000000?text=Scenery',
  link: 'https://youtu.be/oJOKRI3ThwA?si=fD-XSl5ZdCLFb-4M',
);

class VideoPlayerScreen extends StatefulWidget {
  final String videoLink;

  VideoPlayerScreen({required this.videoLink});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoLink)!,
      flags: YoutubePlayerFlags(autoPlay: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            // Do something when the video is ready to play.
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
