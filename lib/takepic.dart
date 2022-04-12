import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class takepic extends StatelessWidget {
  const takepic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Take Picture"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async{
              image = await ImagePicker.pickImage(source: ImageSource.gallery);
              setState((){

              });
            },
            child: const Text("from photos"),
            style: ElevatedButton.styleFrom(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(color: Color(0xFF168B01),width: 1.0,style: BorderStyle.solid),
              primary: const Color.fromARGB(255, 0, 224, 144),
              padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
              shadowColor: const Color.fromARGB(255, 0, 255, 247),
              elevation: 15,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
            onPressed: () async{
              image = await ImagePicker.pickImage(source: ImageSource.camera);
              setState((){

              });
            },
            child: const Text("take a photo"),
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              side: const BorderSide(color: Color(0xFF31801A),width: 1.0,style: BorderStyle.solid),
              primary: const Color.fromARGB(255, 139, 255, 36),
              shadowColor: const Color.fromARGB(250, 2, 203, 255),
              elevation: 15,
              padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
            ),
          ),
        ],
      ),
    );
  }
}
