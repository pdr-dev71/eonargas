import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDemo extends StatefulWidget {
  const VideoDemo({Key? key}) : super(key: key);

  final String title = "Video Demo";

  @override
  VideoDemoState createState() => VideoDemoState();
}

class VideoDemoState extends State<VideoDemo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  int index = 0;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("videos/eonarga.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
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
        title: const Text("Narguilera"),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: IndexedStack(
                      index: index,
                      children: [
                        Card(
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              setState(() {
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  _controller.play();
                                  index = 1;
                                }
                              });
                            },
                            child: const Center(
                              child: SizedBox(
                                width: 300,
                                height: 100,
                                child: Text(
                                  'Nargs',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        VideoPlayer(_controller),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                exit(0);
              });
            },
            icon: const Icon(Icons.exit_to_app),
            label: const Text('Num quero não'),
          ),
        ],
      ),
    );
  }
}
