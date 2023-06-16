import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:flutterreels/screens/swiper_component.dart';
import 'package:flutterreels/service/fetchAPI.dart';

import '../model/reel_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Hits> reels = [];

  final List<String> videos = [
    'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
  ];
  @override
  void initState() {
    // Service().fetchReels().then((results) {
    //   setState(() {
    //     reels = results;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Flutter Reels"),
      ),
      body: Stack(
        children: [
          // Swiper(
          //   autoplay: false,
          //   itemWidth: MediaQuery.of(context).size.width,
          //     scrollDirection: Axis.vertical,
          //     itemBuilder: (context, index) {
          //       return SwiperComponent(mediaLink: reels[index].videos!.large!.url!);
          //     },
          //     itemCount: reels.length)
          Swiper(
              autoplay: false,
              itemWidth: MediaQuery.of(context).size.width,
              itemHeight: MediaQuery.of(context).size.height,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return SwiperComponent(mediaLink: videos[index]);
              },
              itemCount: videos.length)
        ],
      ),
    );
  }
}
