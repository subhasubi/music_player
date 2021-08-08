import 'package:flutter/material.dart';
import 'package:music_player/home.dart';

void main() {
  runApp(MusicApp());
}

class MusicApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
