
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  final String urlVideo;

  const VideoApp({Key? key, required this.urlVideo}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.urlVideo)
      ..initialize().then((_) {
        setState(() {}); // برای به‌روز رسانی وضعیت UI پس از مقداردهی اولیه
      }).catchError((error) {
        print(error.toString()); // نمایش جزئیات خطا در کنسول
      });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(

          leading:  IconButton(
            color: Colors.orange.shade500,
            icon: Icon(CupertinoIcons.arrow_right_circle_fill,
                size: MediaQuery.of(context).size.width * 0.08),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Center(child: Text('نمایش ویدیو', style: TextStyle(color: Colors.orange))),
        ),
        body: Center(
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
