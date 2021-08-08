import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool playing = false;
  IconData playButton = Icons.play_arrow;

  AudioPlayer? _player;
  AudioCache? cache;

  Duration position = Duration();
  Duration musicLength = Duration();

  Widget slider() {
    return Slider.adaptive(
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value) {
          seekToSec(value.toInt());
        });
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player!.seek(newPos);
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _player = AudioPlayer();
  //   cache = AudioCache(fixedPlayer: _player);
  //
  //   _player!.onDurationChanged.listen((d) {
  //     print('Max Duration: $d');
  //     setState(() {
  //       musicLength = d;
  //     });
  //   });
  //
  //   _player!.onAudioPositionChanged.listen((p) {
  //     print('Current position: $p');
  //     setState(() {
  //       position = p;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.blue.shade400,
              Colors.blue.shade50,
            ])),
        child: Padding(
          padding: EdgeInsets.only(top: 48),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Music Beatzz',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Let\'s Listen Our Favorites',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 15),
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                          image: AssetImage('assets/image.jpg'))),
                ),
                SizedBox(height: 15),
                Text(
                  'Adi Penne',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 25,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 25),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        slider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                iconSize: 45,
                                onPressed: () {},
                                icon: Icon(Icons.skip_previous)),
                            IconButton(
                                iconSize: 55,
                                onPressed: () {
                                  if (!playing) {
                                    cache!.play('Adi-Penne.mp3');
                                    setState(() {
                                      playButton = Icons.pause;
                                      playing = true;
                                    });
                                  } else {
                                    _player!.pause();
                                    setState(() {
                                      playButton = Icons.play_arrow;
                                      playing = false;
                                    });
                                  }
                                },
                                icon: Icon(playButton)),
                            IconButton(
                                iconSize: 45,
                                onPressed: () {},
                                icon: Icon(Icons.skip_next)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
