import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final accountnum = TextEditingController();
  final passnum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("Images/pic_personal.png"),
          const SizedBox(height: 24.0,),
          TextField(
            decoration: const InputDecoration(
              labelText: 'nickname',
              filled: true,
              fillColor: Color.fromARGB(216, 144, 210, 220),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
            ),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
            controller: nickname,
          ),
          const SizedBox(
            height: 16.0,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'account',
              filled: true,
              fillColor: Color.fromARGB(216, 144, 210, 220),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
            ),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
            controller: accountnum,
          ),
          const SizedBox(
            height: 16.0,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'password',
              filled: true,
              fillColor: Color.fromARGB(216, 144, 210, 220),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
            ),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
            controller: passnum,
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
