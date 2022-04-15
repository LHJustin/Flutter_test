import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/generated/l10n.dart';
import 'package:untitled/home.dart';
import 'package:untitled/main.dart';

class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).signUp),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

StreamController<File> streamController = StreamController<File>.broadcast();

class _BodyState extends State<Body> {
  final nickname = TextEditingController();
  final account = TextEditingController();
  final pass = TextEditingController();
  var num;
  String? image;

  _remember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name$num", nickname.text.toString());
    await prefs.setString("account$num", account.text.toString());
    await prefs.setString("password$num", pass.text.toString());
    await prefs.setString("pic$num", image!);
    await prefs.setInt("id", num);
    await prefs.setInt("num", ++num);
    await prefs.setBool("login", true);
  }

  Future<int> _getNum() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    num = prefs.getInt("num") ?? 0;
    return num;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      //超出範圍可滑動
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                StreamBuilder(
                    stream: streamController.stream,
                    builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
                      if (snapshot.data != null) {
                        //readAsBytes讓snapshot的file資料變成Uint8List的資料類型，再用base64Encode讓image可以是一個String
                        snapshot.data!.readAsBytes().then((value) {
                          image = base64Encode(value);
                        });
                        return Image.file(snapshot.data!);
                      } else {
                        return Image.asset("Images/pic_personal.png");
                      }
                    }),
                /* if(image != null)
                  Image.memory(image!),
                if(image == null)
                  ,*/
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "pic");
                    },
                    child: Image.asset(
                      "Images/btnedit.png",
                      width: 28,
                      height: 28,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24.0),
            TextField(
              decoration: InputDecoration(
                labelText: S.of(context).nickname,
                labelStyle: const TextStyle(color: Colors.black),
                hintText: S.of(context).enternick,
                filled: true,
                fillColor: const Color.fromARGB(216, 202, 164, 255),
                border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.purpleAccent)),
              ),
              inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[ ]'))],
              controller: nickname,
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: S.of(context).accountnum,
                labelStyle: const TextStyle(color: Colors.black),
                hintText: S.of(context).enteraccount,
                filled: true,
                fillColor: const Color.fromARGB(201, 246, 126, 181),
                border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.purpleAccent)),
              ),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
              controller: account,
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: S.of(context).password,
                labelStyle: const TextStyle(color: Colors.black),
                hintText: S.of(context).enterpass,
                filled: true,
                fillColor: const Color.fromARGB(201, 246, 126, 181),
                border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.purpleAccent)),
              ),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
              controller: pass,
            ),
            const SizedBox(height: 16.0),
            FutureBuilder(
              future: _getNum(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (!snapshot.hasData) {
                  return ElevatedButton(
                    onPressed: null,
                    child: Text(S.of(context).signUp),
                  );
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      int accountnum;
                      int passnum;
                      String name;
                      name = nickname.text.toString();
                      accountnum = account.text.toString().length;
                      passnum = pass.text.toString().length;
                      if (accountnum < 4 || accountnum > 20 || passnum < 6 || passnum > 12 || name.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(S.of(context).message),
                                content: Text(S.of(context).wrongformat),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(S.of(context).message),
                                content: Text(S.of(context).success),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      await _remember();
                                      Navigator.pushNamedAndRemoveUntil(context, 'my', (_) => false);
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            });
                      }
                    },
                    child: const Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      shadowColor: Colors.orangeAccent,
                      elevation: 8,
                      padding: const EdgeInsets.fromLTRB(72, 0, 72, 0),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
