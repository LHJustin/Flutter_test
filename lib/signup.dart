import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/home.dart';
import 'package:untitled/main.dart';

class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  final nickname = TextEditingController();
  final account = TextEditingController();
  final pass = TextEditingController();
  var num;

  _remember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name$num", nickname.text.toString());
    await prefs.setString("account$num", account.text.toString());
    await prefs.setString("password$num", pass.text.toString());
    await prefs.setInt("id", num);
    await prefs.setInt("num", ++num);
    await prefs.setBool("login", true);
  }

  Future<int> _getNum() async{
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
            Image.asset("Images/pic_personal.png"),
            const SizedBox(height: 24.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'nickname',
                labelStyle: TextStyle(color: Colors.black),
                hintText: "Textbox can't empty",
                filled: true,
                fillColor: Color.fromARGB(216, 202, 164, 255),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purpleAccent)),
              ),
              inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[ ]'))],
              controller: nickname,
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'account',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'enter 4~20 words',
                filled: true,
                fillColor: Color.fromARGB(201, 246, 126, 181),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purpleAccent)),
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
                fillColor: Color.fromARGB(201, 246, 126, 181),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purpleAccent)),
              ),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
              controller: pass,
            ),
            const SizedBox(height: 16.0),
            FutureBuilder(
              future: _getNum(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                if(!snapshot.hasData){
                  return ElevatedButton(onPressed: null, child: Text("Sign up"),);
                }else{
                  return ElevatedButton(
                      onPressed: () {
                        var accountnum;
                        var passnum;
                        var name;
                        name = nickname.text.toString();
                        accountnum = account.text.toString().length;
                        passnum = pass.text.toString().length;
                        if (accountnum < 4 || accountnum > 20 || passnum < 6 || passnum > 12 || name.length == 0) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Message"),
                                  content: Text("Your format is wrong."),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("OK"))
                                  ],
                                );
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Message"),
                                  content: Text("Log in success."),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () async{
                                          await _remember();
                                          Navigator.pushNamedAndRemoveUntil(context, 'my', (_) => false);
                                        },
                                        child: Text("OK"))
                                  ],
                                );
                              });
                        }
                      },
                      child: Text("Sign Up"));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
