import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bpage extends StatelessWidget {
  const Bpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是Ｂ頁'),
      ),
      body: ElevatedButton(
        child: Text('返回首頁'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
