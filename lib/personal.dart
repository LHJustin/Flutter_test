import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class personal extends StatelessWidget {
  const personal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  var nickname;
  var account;
  late List data;

  Body({Key? key}) : super(key: key);

  Future<List> _data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = await prefs.getInt("id");
    nickname = await prefs.getString("name$id");
    account = await prefs.getString("account$id");
    data.add(nickname);
    data.add(account);
    return data;
  }

  _log() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("login", false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: (ElevatedButton(
                onPressed: () async {
                  await _log();
                  Navigator.pushNamedAndRemoveUntil(context, 'my', (_) => false);
                },
                child: const Text("Log Out"),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 139, 72, 215)),
                    //字體顏色
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 147, 237, 255)),
                    //背景顏色
                    shadowColor: MaterialStateProperty.all(Colors.blue),
                    //陰影顏色
                    elevation: MaterialStateProperty.all(8),
                    //陰影值
                    shape: MaterialStateProperty.all(const StadiumBorder(
                        side: BorderSide(
                      style: BorderStyle.solid,
                      color: Color.fromARGB(255, 88, 255, 214),
                    ))) //圓角邊框
                    ),
              )),
            ),
            FutureBuilder(
                future: _data(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      alignment: Alignment.center,
                      child: (Column(
                        children: [
                          Image.asset("Images/pic_personal.png"),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Text("Nickname:${data[0]}"),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Text("Account:${data[1]}"),
                        ],
                      )),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
