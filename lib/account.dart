import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/signup.dart';
import 'package:untitled/main.dart';
import 'package:untitled/search.dart';

class account extends StatelessWidget {
  const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  final account = TextEditingController();
  final pass = TextEditingController();
  var i;
  var num;
  var prefcount;
  var prefpass;

  Body({Key? key}) : super(key: key);

  _check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefcount = prefs.getString("account$i") ?? "";
    prefpass = prefs.getString("password$i") ?? "";
    print("account:$prefcount");
  }

  _num() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    num = prefs.getInt("num") ?? 0;
    print("num:$num");
  }

  _log() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("id", i);
    await prefs.setBool("login", true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Log In",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: const InputDecoration(
                labelText: 'account',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'enter 4~20 words',
                filled: true,
                fillColor: Color.fromARGB(216, 144, 210, 220),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
              ),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
              controller: account,
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'password',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'enter 6~12 words',
                filled: true,
                fillColor: Color.fromARGB(216, 144, 210, 220),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)), //輸入文字時的變化
              ),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))], //填寫格式設計
              //看不到內容（密碼格式）
              obscureText: true,
              controller: pass,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                var accountword = account.text.toString();
                var password = pass.text.toString();
                var y = 0;
                await _num();
                for (i = 0; i <= num; i++) {
                  await _check();
                  if (accountword == prefcount && password == prefpass && accountword != "" && password != "") {
                    await _log();
                    y = y + 1;
                  }
                }
                if (y > 0) {
                  Navigator.pushNamedAndRemoveUntil(context, 'my', (_) => false);
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Message"),
                          content: const Text("Your account or password is wrong."),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK"))
                          ],
                        );
                      });
                }
              },
              child: const Text("Log In"),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                shadowColor: Colors.orangeAccent,
                elevation: 8,
                padding: const EdgeInsets.fromLTRB(72, 0, 72, 0),
              ),
            ),
            const SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'sign');
              },
              child: const Text("Sign Up"),
              style: TextButton.styleFrom(
                primary: const Color.fromARGB(255, 131, 15, 213),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
