// video_post_screen.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';
import 'dynamiclink.dart';
class VideoPostScreen extends StatefulWidget {
  @override
  _VideoPostScreenState createState() => _VideoPostScreenState();
}

class _VideoPostScreenState extends State<VideoPostScreen> {
  late VideoPlayerController _controller;
  final String postId = "video-post-1"; // A unique ID for the video post.

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://samplelib.com/lib/preview/mp4/sample-5s.mp4', // Replace with your video URL.
    )
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown after the video is initialized.
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Post'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : CircularProgressIndicator(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _sharePost(),
              child: Text('Share'),
            ),
          ],
        ),
      ),
    );
  }

  void _sharePost() async {
    // Generate the dynamic link for the specific video post.
    String link = await DynamicLinkService().createDynamicLink(postId);

    // Share the generated link using the share_plus package.
    Share.share('Check out this video post: $link');
  }
}
