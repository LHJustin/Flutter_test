import 'package:flutter/material.dart';

import 'Bpage.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(5),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          child: const Text("test1"),
          color: Colors.greenAccent,
        ),
        Container(
          child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Bpage()));
              },
              child: Stack(
                children: [
                  FadeInImage.assetNetwork(placeholder: "Images/mm.jpg", image: "https://storage.googleapis.com/lottcube/production/1/headphoto/headphoto1644397354.png"),
                  Column(
                    children: const [
                      Text(
                        "data",
                        style: TextStyle(backgroundColor: Color.fromARGB(100, 256, 256, 256), color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                  Column(
                    verticalDirection: VerticalDirection.up,
                    children: [
                      Text(
                        "cc",
                        style: TextStyle(backgroundColor: Color.fromARGB(100, 256, 256, 256), color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        "data",
                        style: TextStyle(backgroundColor: Color.fromARGB(100, 256, 256, 256), color: Colors.white),
                      ),
                    ],
                  )
                ],
              )),
          color: Colors.purple,
        )
      ],
    );
  }
}
