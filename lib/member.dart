import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/account.dart';
import 'package:untitled/personal.dart';

class member extends StatefulWidget {
  const member({Key? key}) : super(key: key);

  @override
  State<member> createState() => _memberState();
}

class _memberState extends State<member> {
  Future<bool> _islogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("login") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _islogin(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return snapshot.data! ? personal() : account();
      },
    );
  }
}
