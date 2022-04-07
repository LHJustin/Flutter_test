import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chatroom.dart';
import 'json/jsonprogram.dart';
import 'main.dart';

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  List jlist = [];

  Future<List<LightyearList>> getProgram() async {
    var dio = Dio();
    Response response = await dio.get('https://api.jsonserve.com/qHsaqy');
    print('${response.data['result']['lightyear_list'].length}');
    List<dynamic> jlist = response.data['result']['lightyear_list'];
    jlist.forEach((element) {
      Map<String, dynamic> map = element;
      print('$map');
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
        return SingleChildScrollView(
            child: Column(
              children: [
                TextField(),
                Text("data"),
                GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  padding: const EdgeInsets.all(5),
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: <Widget>[
                    Container(),
                  ],
                ),
                Text("data"),
                GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(5),
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: <Widget>[
                    for (int i = 0; i < snapshot.data!.length; i++)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => chatroom()));
                        },
                        child: Container(
                          color: Colors.purple,
                          child: Stack(
                            children: [
                              FadeInImage.assetNetwork(
                                placeholder: "Images/mm.jpg",
                                image: "${snapshot.data![i].headPhoto}",
                                fit: BoxFit.cover,
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${snapshot.data![i].streamTitle}',
                                    style: TextStyle(backgroundColor: Color.fromARGB(100, 256, 256, 256), color: Colors.white, fontSize: 20),
                                  )
                                ],
                              ),
                              Column(
                                verticalDirection: VerticalDirection.up,
                                children: [
                                  Text(
                                    "${snapshot.data![i].nickname}",
                                    style: TextStyle(backgroundColor: Color.fromARGB(100, 256, 256, 256), color: Colors.white, fontSize: 24),
                                  ),
                                  Text(
                                    "${snapshot.data![i].tags}",
                                    style: TextStyle(backgroundColor: Color.fromARGB(100, 256, 256, 256), color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
        );
      },
    );
  }
}
