import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/account.dart';
import 'package:untitled/chatroom.dart';
import 'package:untitled/home.dart';
import 'package:untitled/personal.dart';
import 'package:untitled/search.dart';
import 'package:untitled/signup.dart';
import 'package:untitled/takepic.dart';

import 'member.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      routes: <String, WidgetBuilder>{
        "my": (BuildContext context) => new MyHomePage(),
        "home": (BuildContext context) => new home(),
        "search": (BuildContext context) => new search(),
        "account": (BuildContext context) => new account(),
        "sign": (BuildContext context) => new signup(),
        "pic" : (BuildContext) => new takepic(),
        "chat": (BuildContext) => new chatroom(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var bool;
  List pages = [
    home(),
    search(),
    member(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Test'),
      ),
      body: pages[_counter],
      bottomNavigationBar: button(),
    );
  }

  @override
  Widget button() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "account")
      ],
      currentIndex: _counter,
      onTap: (int index) {
        setState(() {
          _counter = index;
        });
      },
    );
  }
}
