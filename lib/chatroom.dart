import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/json/jsonclose.dart';
import 'package:untitled/json/jsoninto.dart';
import 'package:untitled/json/jsonmessage.dart';
import 'package:untitled/json/jsonnoticce.dart';
import 'package:untitled/json/jsonsend.dart';
import 'package:video_player/video_player.dart';
import 'package:web_socket_channel/io.dart';

class chatroom extends StatefulWidget {
  const chatroom({Key? key}) : super(key: key);

  @override
  State<chatroom> createState() => _chatroomState();
}

class _chatroomState extends State<chatroom> {
  final msg = TextEditingController();
  var _controller;
  var name;
  var dio = Dio();
  var channel;
  List msglist = [];

  @override
  void initState() {
    super.initState();
    link();
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

  link() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var iflog = prefs.getBool('login') ?? false;
    if (iflog) {
      var id = prefs.getInt("id");
      name = prefs.getString("name$id");
    } else {
      name = "visitor";
    }
    channel= IOWebSocketChannel.connect('wss://lott-dev.lottcube.asia/ws/chat/chat:app_test?nickname=$name');
  }

  Future<List> getMessage() async {
    message talk;
    var enter;
    var broadcast;
    var end;
    channel.stream.listen((data){
      print("aaaaaa:$data");
      if({"event":"default_message"} == data){
        talk = message.fromJson(data);
      }else if({"event":"sys_updateRoomStatus"} == data){
        enter = into.fromJson(data);
      }else if({"event":"admin_all_broadcast"} == data){
        broadcast = notice.fromJson(data);
      }else if({"event":"sys_room_endStream"} == data){
        end = close.fromJson(data);
      }
    });
    return msglist;
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
                  SizedBox(
                    width: 15,
                  ),
                  //對話框，不用expanded讓內容讓textfield物件彈性一點畫面會爆掉
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "send message",
                        filled: true,
                        fillColor: Color.fromARGB(89, 90, 90, 90),
                      ),
                      controller: msg,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  //送出對話按鈕
                  Container(
                    child: ElevatedButton(
                      onPressed: () async {
                        print(name);
                        channel.sink.add(send(action: "N", content: msg.text.toString()));
                      },
                      child: const Icon(Icons.send),
                      style: ElevatedButton.styleFrom(shape: const CircleBorder(), padding: const EdgeInsets.all(13)),
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                future: getMessage(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (!snapshot.hasData) {
                    print("no data");
                    return Container();
                  }
                  return //限制ListView最大高度
                      ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 175.0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 80, 0),
                      child: Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          reverse: true,
                          children: [
                            Text("hahahahahahahahahahahahahahahahahahahahahahahaha"),
                            Text("hehehe"),
                            Text("hohoho"),
                            Text("hahahahahahahahahahahahahahahahahahahahahahahaha"),
                            Text("hehehe"),
                            Text("hohoho"),
                            Text("hahahahahahahahahahahahahahahahahahahahahahahaha"),
                            Text("hehehe"),
                            Text("hohoho"),
                            Text("hahahahahahahahahahahahahahahahahahahahahahahaha"),
                            Text("hehehe"),
                            Text("hohoho"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
