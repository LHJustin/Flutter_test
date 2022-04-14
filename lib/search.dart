import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'chatroom.dart';
import 'json/jsonprogram.dart';
import 'main.dart';

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);

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
  String search = "";

  Future<List<LightyearList>> getProgram() async {
    var dio = Dio();
    Response response = await dio.get('https://api.jsonserve.com/qHsaqy');
    print('${response.data['result']['lightyear_list'].length}');
    List<dynamic> jlist = response.data['result']['lightyear_list'];
    for (var element in jlist) {
      Map<String, dynamic> map = element;
      // print('$map');
    }
    List<LightyearList> programlist = [];
    for (Map<String, dynamic> i in jlist) {
      programlist.add(LightyearList.fromJson(i));
    }
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
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(5, 0, 40, 0),
                    child: TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "search",
                      ),
                      inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[ ]'))],
                      onSubmitted: (val) {
                        print(val);
                        setState(() {
                          search = val;
                        });
                      },
                    ),
                  ),
                  if (search != "")
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Search Result",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 116, 64, 0),
                            ),
                          ),
                        ),
                        GridView.count(
                          //下兩行防止GridView滾動影響ListView
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          padding: const EdgeInsets.all(5),
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          children: <Widget>[
                            for (int i = 0; i < snapshot.data!.length; i++)
                              if (snapshot.data![i].streamTitle!.contains(search) || snapshot.data![i].nickname!.contains(search) || snapshot.data![i].tags!.contains(search))
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
                        ),
                      ],
                    ),
                  const Text(
                    "Most View",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 22, 0, 80),
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
