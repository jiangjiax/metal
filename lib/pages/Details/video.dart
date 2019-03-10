    
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:metal/data/global_home.dart';


class Video extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VideoState();
  }
}

class _VideoState extends State<Video> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 262.0,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}

class SwiperPages extends StatefulWidget {
  SwiperPages({Key key, this.index}) : super(key: key);
  final int index;

  @override
  SwiperPagesState createState() {
    return SwiperPagesState();
  }
}

class SwiperPagesState extends State<SwiperPages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 262.0,
      child: new Swiper(
        itemCount: homePageContent["ad"].length,
        // viewportFraction: 0.8,
        // scale: 0.9,
        autoplay: true,
        loop:true,
        duration: 1000,
        autoplayDelay: 10000,
        // control: new SwiperControl(),
        onTap: (index) => print('点击了第$index个'),
        pagination: new SwiperPagination(
            margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
            builder: new DotSwiperPaginationBuilder(
                color: Colors.white30,
                activeColor: Colors.white,
                size: 10.0,
                activeSize: 8.0)
        ),
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "$urler${homePageContent["ad"][index]["pathname"].toString()}",
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}