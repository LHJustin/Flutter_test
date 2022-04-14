import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/json/jsonclose.dart';
import 'package:untitled/json/jsoninto.dart';
import 'package:untitled/json/jsonmessage.dart';
import 'package:untitled/json/jsonnoticce.dart';
import 'package:untitled/json/jsonsend.dart';
import 'package:video_player/video_player.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class chatroom extends StatefulWidget {
  const chatroom({Key? key}) : super(key: key);

  @override
  State<chatroom> createState() => _chatroomState();
}

class _chatroomState extends State<chatroom> {
  final msg = TextEditingController();
  var _controller;
  String? name;
  var dio = Dio();
  WebSocketChannel? channel;

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
        Timer.periodic(const Duration(seconds: 180), (Timer time) {
          // print(time);
        });
      });
  }

  Future<bool> link() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var iflog = prefs.getBool('login') ?? false;
    if (iflog) {
      var id = prefs.getInt("id");
      name = prefs.getString("name$id");
    } else {
      name = "visitor";
    }
    channel = IOWebSocketChannel.connect(
      Uri.parse('wss://lott-dev.lottcube.asia/ws/chat/chat:app_test?nickname=$name'),
    );
    return true;
  }

  void disponse() {
    super.dispose();
    _controller.pause();
    channel!.sink.close();
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
                    : const Text("正在初始化"),
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
                  const SizedBox(
                    width: 15,
                  ),
                  //對話框，不用expanded讓內容讓textfield物件彈性一點畫面會爆掉
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "send message",
                        filled: true,
                        fillColor: Color.fromARGB(89, 90, 90, 90),
                      ),
                      inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[ ~!#\$%^&*()_-+=?<>.—，。/\\|《》？;:：\'‘；“]'))],
                      controller: msg,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  //送出對話按鈕
                  ElevatedButton(
                    onPressed: () async {
                      //訊息傳入websockets
                      channel!.sink.add(json.encode(send(action: "N", content: msg.text.toString())));
                      msg.clear();
                    },
                    child: const Icon(Icons.send),
                    style: ElevatedButton.styleFrom(shape: const CircleBorder(), padding: const EdgeInsets.all(13)),
                  ),
                ],
              ),
              FutureBuilder(
                future: link(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  return StreamBuilder(
                    stream: channel!.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        print("no data");
                        return Container();
                      } else {
                        print("test:${snapshot.data.toString()}");
                        var response = jsonDecode(snapshot.data.toString());
                        List msglist = [];
                        if(snapshot.data.toString().contains("undefined")) {
                          msglist.add("invalid message.");
                        }
                        if (snapshot.data.toString().contains("default_message")) {
                          message talk = message.fromJson(response);
                          msglist.add("${talk.body?.nickname}：${talk.body?.text}");
                        } else if (snapshot.data.toString().contains("sys_updateRoomStatus")) {
                          into enter = into.fromJson(response);
                          if (enter.body?.entryNotice?.action == "enter") {
                            msglist.add("${enter.body?.entryNotice?.username} enter the room.");
                          }
                          if(enter.body?.entryNotice?.action == "leave") {
                            msglist.add("${enter.body?.entryNotice?.username} leave the room.");
                          }
                        } else if (snapshot.data.toString().contains("admin_all_broadcast")) {
                          notice broadcast = notice.fromJson(response);
                          msglist.add("cn：${broadcast.body?.content?.cn}\nen：${broadcast.body?.content?.en}\ntw：${broadcast.body?.content?.tw}");
                        } else if (snapshot.data.toString().contains("sys_room_endStream")) {
                          close end = close.fromJson(response);
                          msglist.add("${end.body?.text}");
                        }
                        //限制ListView最大高度
                        return ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 175.0),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(15, 0, 80, 0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    reverse: true,
                                    children: [
                                      for(var text in msglist)
                                        Text("$text"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
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
        backgroundColor: const Color.fromARGB(116, 236, 217, 70),
        child: const Icon(Icons.exit_to_app),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
