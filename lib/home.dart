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
    return const Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List jlist = [];

  @override
  void initState() {
    getProgram();
  }

  Future<List<LightyearList>> getProgram() async {
    var dio = Dio();
    Response response = await dio.get('https://api.jsonserve.com/qHsaqy');
    print('${response.data['result']['lightyear_list'].length}');
    List<dynamic> jlist = response.data['result']['lightyear_list'];
    jlist.forEach((element) {
      Map<String, dynamic> map = element;
      // print('$map');
    });
    List<LightyearList> programlist = [];
    for (Map<String, dynamic> i in jlist) {
      programlist.add(LightyearList.fromJson(i));
    }
    // var programList = response.data['result']['lightyear_list'].map((m) => new LightyearList.fromJson(m)).toList();
    return programlist;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProgram(),
      builder: (BuildContext context, AsyncSnapshot<List<LightyearList>> snapshot) {
        if (!snapshot.hasData) {
          print("no data");
          return Container();
        }
        print(snapshot.data?[0].streamId);
        return GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          children: <Widget>[
            for (int i = 0; i < snapshot.data!.length; i++)
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const chatroom()));
                },
                child: Container(
                  color: Colors.purple,
                  child: Stack(
                    children: [
                      FadeInImage.assetNetwork(
                        placeholder: "Images/mm.jpg",
                        image: "${snapshot.data![i].headPhoto}",
                        imageErrorBuilder: (context, error, stackTrace){
                          return Image.asset("Images/mm.jpg");
                        },
                        fit: BoxFit.cover,
                      ),
                      Column(
                        children: [
                          Text(
                            '${snapshot.data![i].streamTitle}',
                            style: const TextStyle(backgroundColor: Color.fromARGB(100, 256, 256, 256), color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                      Column(
                        verticalDirection: VerticalDirection.up,
                        children: [
                          Text(
                            "${snapshot.data![i].nickname}",
                            style: const TextStyle(backgroundColor: Color.fromARGB(100, 256, 256, 256), color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "${snapshot.data![i].tags}",
                            style: const TextStyle(backgroundColor: Color.fromARGB(100, 256, 256, 256), color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
