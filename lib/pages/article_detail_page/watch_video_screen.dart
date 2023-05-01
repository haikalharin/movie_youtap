import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../data/model/watch_video_model/watch_video_model.dart';

class WatchVideoScreen extends StatefulWidget {
  const WatchVideoScreen({
    Key? key,
    //3
     this.listWatchVideo,
  }) : super(key: key);
  final  List<WatchVideoModel>? listWatchVideo;

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  List<WatchVideoModel> _videos = [];
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    //1
    _videos = widget.listWatchVideo??[];
    //2
    _controller = YoutubePlayerController(
      initialVideoId: _videos[0].key??'',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    //3
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1
      appBar: AppBar(
        leading:  GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
        'Trailer',
        ),
      ),
      //2
      body: YoutubePlayerBuilder(
        //3
        player: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
        //4
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //2
                      for (int i = 0; i < _videos.length; i++)
                        Container(
                          height: 100.h,
                          padding:
                          EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            children: <Widget>[
                              //3
                              GestureDetector(
                                onTap: () {
                                  _controller.load(_videos[i].key.toString());
                                  _controller.play();
                                },
                                //4
                                child: CachedNetworkImage(
                                  width: 170,
                                  imageUrl: YoutubePlayer.getThumbnail(
                                    videoId: _videos[i].key.toString(),
                                    quality: ThumbnailQuality.high,
                                  ),
                                ),
                              ),
                              //5
                              Expanded(
                                child: Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(
                                    _videos[i].name??'',
                                    style:
                                    Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
