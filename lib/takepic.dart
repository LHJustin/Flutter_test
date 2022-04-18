import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/generated/l10n.dart';
import 'package:untitled/signup.dart';

class takepic extends StatelessWidget {
  const takepic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Take Picture"),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Uint8List? imgbytes;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imgbytes != null)
            //Unit8list資料
            Image.memory(imgbytes!),
          ElevatedButton(
            onPressed: () async {
              XFile? image = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                maxHeight: 150,
                maxWidth: 150,
              );
              if (image != null) {
                File imagefile = File(image.path);
                streamController.add(imagefile);
                imgbytes = await imagefile.readAsBytes();
              } else {
                print("read image from gallery failed");
              }
              Navigator.pop(context);
            },
            child: Text(S.of(context).fromPhoto),
            style: ElevatedButton.styleFrom(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(color: Color(0xFF168B01), width: 1.0, style: BorderStyle.solid),
              primary: const Color.fromARGB(255, 0, 224, 144),
              // padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
              shadowColor: const Color.fromARGB(255, 0, 255, 247),
              elevation: 15,
              minimumSize: const Size.fromHeight(50),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
            onPressed: () async {
              XFile? image = await ImagePicker().pickImage(
                source: ImageSource.camera,
                maxHeight: 150,
                maxWidth: 150,
              );
              if (image != null) {
                File imagefile = File(image.path);
                streamController.add(imagefile);
                imgbytes = await imagefile.readAsBytes();
              } else {
                print("read image from camera is failed");
              }
              Navigator.pop(context);
            },
            child: Text(S.of(context).takeAPhoto),
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              side: const BorderSide(color: Color(0xFF31801A), width: 1.0, style: BorderStyle.solid),
              primary: const Color.fromARGB(255, 139, 255, 36),
              shadowColor: const Color.fromARGB(250, 2, 203, 255),
              elevation: 15,
              // padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
              minimumSize: const Size.fromHeight(50),
            ),
          ),
        ],
      ),
    );
  }
}
