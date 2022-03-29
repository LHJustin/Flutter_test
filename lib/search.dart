

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text('返回首頁'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
        },
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
