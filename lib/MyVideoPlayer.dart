import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({Key? key}) : super(key: key);

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  VideoPlayerController? controller;

  String asset = "assets/my_video.mp4";
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(asset)
      ..initialize().then((_) {
        setState(() {});
      });

    controller!.setLooping(true);

    controller!.play();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player App"),
        centerTitle: true,
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: pageController,
        children: [
          Container(
            child: VideoPlayer(controller!),
          ),
          Container(
            child: VideoPlayer(controller!),
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
