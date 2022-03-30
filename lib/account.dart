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
  var i =0;
  var num = 0;
  var prefcount = "";
  var prefpass = "";
  @override

  _check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    num = prefs.getInt("num") ?? 0;
    prefcount = prefs.getString("account$i") ?? "";
    prefpass = prefs.getString("pass$i") ?? "";
    print("account:$prefcount");
  }
  _log() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
            ),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
            //看不到內容（密碼格式）
            obscureText: true,
            controller: pass,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
              onPressed: () {
                _check();
                for(i; i<=num ; i++){
                  if(account.text.toString()==prefcount && pass.text.toString()==prefpass){
                    _log();
                    Navigator.pushNamedAndRemoveUntil(context, 'my', (_) => false);
                  }else{
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Message"),
                            content: Text("Your account or password is wrong."),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"))
                            ],
                          );
                        });
                  }
                }
              },
              child: Text("Log In")),
          const SizedBox(height: 8.0),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'sign');
              },
              child: const Text("Sign Up"))
        ],
      ),
    );
  }
}
