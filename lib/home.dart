import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/chatroom.dart';

import 'json/jsonprogram.dart';
import 'member.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  
  Future<List<program>> getProgram() async{
    Response response;
    var dio = Dio();
    response = await dio.get("https://api.jsonserve.com/qHsaqy",options: Options(responseType: ResponseType.plain));
    var jlist = jsonDecode(response.data);
    var programList = jlist.map((m)=>LightyearList.fromJson(m)).toList();
    print("data:${programList.nickname}");
    return programList;
  }

  @override
  Widget build(BuildContext context){
    getProgram();
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(5),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 2,
      children: <Widget>[
        FutureBuilder(
          future: getProgram(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot){
              if (!snapshot.hasData) {
                print("no data");
                return Container();
              }
              print(snapshot.data);
              return Container(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => chatroom()));
                    },
                    child: Stack(
                      children: [
                        FadeInImage.assetNetwork(placeholder: "Images/mm.jpg", image: "https://storage.googleapis.com/lottcube/production/1/headphoto/headphoto1644397354.png"),
                        Column(
                          children: const [
                            Text(
                              "data",
                              style: TextStyle(backgroundColor: Color.fromARGB(100, 256, 256, 256), color: Colors.white, fontSize: 30),
                            )
                          ],
                        ),
                        Column(
                          verticalDirection: VerticalDirection.up,
                          children: [
                            Text(
                              "cc",
                              style: TextStyle(backgroundColor: Color.fromARGB(100, 256, 256, 256), color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              "data",
                              style: TextStyle(backgroundColor: Color.fromARGB(100, 256, 256, 256), color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    )),
                color: Colors.purple,
              );
            }
        )
      ],
    );
  }
}
