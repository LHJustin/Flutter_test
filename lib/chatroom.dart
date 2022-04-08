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
    _controller = VideoPlayerController.asset("Images/hime3.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
        // _controller.setVolume(0.0);
        Timer.periodic(Duration(seconds: 180), (Timer time) {
          print(time);
        });
      });
  }

  void disponse() {
    //TODO: implement dispose
    super.dispose();
    _controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //背景影片
          Transform.scale(
            scale: _controller.value.aspectRatio / MediaQuery.of(context).size.aspectRatio,
            child: Center(
              child: Container(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Text("正在初始化"),
              ),
            ),
          ),
          Column(
            verticalDirection: VerticalDirection.up,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(width: 15,),
                  //對話框，不用expanded讓內容讓textfield物件彈性一點畫面會爆掉
                  Expanded(
                    child: TextField(),
                  ),
                  //送出對話按鈕
                  Container(
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Icon(Icons.send),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(),
              ),
            ],
          ),
        ],
      ),
      //離開按鈕
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Color.fromARGB(116, 236, 217, 70),
        child: Icon(Icons.exit_to_app),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
