import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class chatroom extends StatefulWidget {
  const chatroom({Key? key}) : super(key: key);

  @override
  State<chatroom> createState() => _chatroomState();
}

class _chatroomState extends State<chatroom> {
  var _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("Images/hime3.mp4");
    setState(() {});
    _controller.play();
    _controller.setLooping(true);
    // _controller.setVolume(0.0);
    Timer.periodic(Duration(seconds: 180), (Timer time) {
      print(time);
    });
  }

  void disponse() {
    // TODO: implement dispose
    super.dispose();
    _controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Transform.scale(
            scale: _controller.value.aspectRatio / MediaQuery.of(context).size.aspectRatio,
            child: Center(
              child: Container(
                child: _controller.value.initialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Text("正在初始化"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
