// xylophone project main focuss -->
// 1. learn responsive UI
// 2. DRY - do not repeat yourcode (if ur doing it is something wrong) by doing= extract(coustom_widget)
// 3. how to install third party packages - audioplayers!!!!

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            for (var i = 0; i < 7; i++) coustom_container(containerNumber: i),
          ],
        ),
      ),
    );
  }
}

class coustom_container extends StatelessWidget {
  coustom_container({super.key, required this.containerNumber});

  final int containerNumber;
  final List<Color> colorList = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.indigo,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    // Mediaquery --> helps to get the size of the screen
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      //for playing sound ontap
      child: Container(
        width: width,
        height: height / 7,
        color: colorList[containerNumber],
      ),
      onTap: () {
        AudioPlayer player = AudioPlayer(); // intialize package
        player.play(
            AssetSource("note${containerNumber + 1}.wav")); // player source
      },
    );
  }
}
