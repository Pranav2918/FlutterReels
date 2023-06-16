import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SwiperComponent extends StatefulWidget {
  final String mediaLink;
  const SwiperComponent({super.key, required this.mediaLink});

  @override
  State<SwiperComponent> createState() => _SwiperComponentState();
}

class _SwiperComponentState extends State<SwiperComponent> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;
  bool _hide = true;
  bool _mute = false;

  @override
  void initState() {
    initVideoPlayer();
    super.initState();
  }

  //Initialize video player
  Future initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.mediaLink);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onTap: () {
                  if (_mute) {
                    setState(() {
                      _mute = false;
                      _hide = false;
                      _videoPlayerController.setVolume(1.0);
                    });
                    Timer(const Duration(milliseconds: 300), () {
                      setState(() {
                        _hide = true;
                      });
                    });
                  } else {
                    setState(() {
                      _mute = true;
                      _hide = false;
                      _videoPlayerController.setVolume(0.0);
                    });
                    Timer(const Duration(milliseconds: 300), () {
                      setState(() {
                        _hide = true;
                      });
                    });
                  }
                },
                onDoubleTap: () {
                  setState(() {
                    _liked = true;
                  });
                  Timer(const Duration(milliseconds: 300), () {
                    setState(() {
                      _liked = false;
                    });
                  });
                },
                onLongPressStart: (v) {
                  _videoPlayerController.pause();
                },
                onLongPressEnd: (v) {
                  _videoPlayerController.play();
                },
                // onLongPressDown: (v) {
                //   _videoPlayerController.pause();
                // },
                child: Chewie(
                  controller: _chewieController!,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),
        if (_liked)
          Center(
            child: Center(
              child: Icon(
                Icons.favorite,
                color: Colors.white.withOpacity(0.8),
                size: 110.0,
              ),
            ),
          ),
        if (!_hide)
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: Alignment.center,
              child: _videoPlayerController.value.volume == 0.0
                  ? Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child:
                          const Center(child: Icon(Icons.volume_off_rounded)))
                  : Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: const Center(child: Icon(Icons.volume_up))),
            ),
          )
      ],
    );
  }
}
