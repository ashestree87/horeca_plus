import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreensaver extends StatefulWidget {
  final List<String> videoAssets;

  VideoScreensaver({required this.videoAssets});

  @override
  _VideoScreensaverState createState() => _VideoScreensaverState();
}

class _VideoScreensaverState extends State<VideoScreensaver> {
  late VideoPlayerController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.asset(widget.videoAssets[_currentIndex])
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });

    _controller.addListener(() {
      if (_controller.value.isBuffering) {
        setState(() {});
      } else if (_controller.value.position == _controller.value.duration) {
        _playNextVideo();
      }
    });
  }

  void _playNextVideo() {
    _controller.dispose();

    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.videoAssets.length;
    });

    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          // Add your custom UI elements on top of the video
        ],
      ),
    );
  }
}
