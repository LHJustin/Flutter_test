import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/generated/l10n.dart';
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
        Timer.periodic(const Duration(seconds: 180), (Timer time) {
          // print(time);
        });
      });
  }

  Future<bool> link() async {
    print('iantest: ssssssssssss');
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

  @override
  void dispose() {
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
          //????????????
          Transform.scale(
            scale: _controller.value.aspectRatio / MediaQuery.of(context).size.aspectRatio,
            child: Center(
              child: Container(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : const Text("???????????????"),
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
                  //??????????????????expanded????????????textfield?????????????????????????????????
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: S.of(context).sendMessage,
                        filled: true,
                        fillColor: const Color.fromARGB(89, 90, 90, 90),
                      ),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\u4e00-\u9fa50-9]"))],
                      controller: msg,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  //??????????????????
                  ElevatedButton(
                    onPressed: () async {
                      //????????????websockets
                      channel!.sink.add(json.encode(send(action: "N", content: msg.text.toString())));
                      msg.clear();
                    },
                    child: const Icon(Icons.send),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(13),
                    ),
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
                        if (snapshot.data.toString().contains("undefined")) {
                          msglist.add("invalid message.");
                        }
                        if (snapshot.data.toString().contains("default_message")) {
                          message talk = message.fromJson(response);
                          msglist.add("${talk.body?.nickname}???${talk.body?.text}");
                        } else if (snapshot.data.toString().contains("sys_updateRoomStatus")) {
                          into enter = into.fromJson(response);
                          if (enter.body?.entryNotice?.action == "enter") {
                            msglist.add(enter.body!.entryNotice!.username!+S.of(context).enter);
                          }
                          if (enter.body?.entryNotice?.action == "leave") {
                            msglist.add(enter.body!.entryNotice!.username!+S.of(context).leave);
                          }
                        } else if (snapshot.data.toString().contains("admin_all_broadcast")) {
                          notice broadcast = notice.fromJson(response);
                          msglist.add("cn???${broadcast.body?.content?.cn}\nen???${broadcast.body?.content?.en}\ntw???${broadcast.body?.content?.tw}");
                        } else if (snapshot.data.toString().contains("sys_room_endStream")) {
                          close end = close.fromJson(response);
                          msglist.add("${end.body?.text}");
                        }
                        //??????ListView????????????
                        return ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 175.0),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(15, 0, 80, 0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    reverse: true,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Column(
                                        //????????????????????????
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          for (var i = 0; i < msglist.length; i++)
                                            Text(
                                              "${msglist[i]}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                backgroundColor: Color.fromARGB(128, 106, 124, 219),
                                              ),
                                            ),
                                        ],
                                      );
                                    },
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
      //????????????
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(S.of(context).message),
                  content:Container(
                    constraints: const BoxConstraints(maxHeight: 100),
                    child: Column(
                      children: [
                        Image.asset("Images/broken_heart.png"),
                        Text(S.of(context).sureleave),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(S.of(context).no),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, 'my', (_) => false);
                      },
                      child: Text(S.of(context).yes),
                    ),
                  ],
                );
              });
        },
        backgroundColor: const Color.fromARGB(116, 236, 217, 70),
        child: const Icon(Icons.exit_to_app),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
