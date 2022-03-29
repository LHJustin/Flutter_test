import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/main.dart';
import 'package:untitled/search.dart';

class account extends StatelessWidget {
  const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body()
    );
  }
}

class Body extends StatelessWidget {
  final accountnum = TextEditingController();
  final passnum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'accont number',
              filled: true,
              fillColor: Color.fromARGB(216, 144, 210, 220),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue))
          ),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
            controller: accountnum,
          ),
          SizedBox(height: 16.0),
          TextField(decoration: InputDecoration(labelText: 'password number',
              filled: true,
              fillColor: Color.fromARGB(216, 144, 210, 220),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue))
          ),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
            controller: passnum,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(onPressed: null, child: Text("Log In")),
        ],
      ),
    );
  }
}
