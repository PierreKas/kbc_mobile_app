import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Teachings extends StatefulWidget {
  const Teachings({super.key});

  @override
  State<Teachings> createState() => _TeachingsState();
}

class _TeachingsState extends State<Teachings> {
  final videoUrl =
      "https://www.youtube.com/watch?v=QzTfBCT0WrQ&pp=ygUYa2luZ2RvbSBiZWxpZXZlcnMgY2h1cmNo";
  final playListUrl = "https://youtu.be/0QuQ7nlreDE";
  late YoutubePlayerController _youtubeController;
  late YoutubePlayerController _youtubeControllerPlayList;
  @override
  void initState() {
    // TODO: implement initState
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    final playListId = YoutubePlayer.convertUrlToId(playListUrl);
    _youtubeController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          captionLanguage: 'en',
        ));
    _youtubeControllerPlayList = YoutubePlayerController(
        initialVideoId: playListId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          captionLanguage: 'en',
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: _youtubeController,
            showVideoProgressIndicator: true,
          ),
          YoutubePlayer(
            controller: _youtubeControllerPlayList,
            showVideoProgressIndicator: true,
          ),
        ],
      ),
    );
  }
}
