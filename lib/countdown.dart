import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game.dart';
import 'package:audioplayers/audioplayers.dart';

class Countdown extends StatefulWidget {
  var round = 0;
  var rounds = 0;
  var points1 = 0;
  var points2 = 0;
  var nextteam = 0;

  Countdown(
    this.round,
    this.rounds,
    this.points1,
    this.points2,
    this.nextteam,
  );

  @override
  _CountdownState createState() =>
      _CountdownState(round, rounds, points1, points2, nextteam);
}

class _CountdownState extends State<Countdown> {
  var _seconds = 3;

  var round = 0;
  var rounds = 0;
  var points1 = 0;
  var points2 = 0;
  var nextteam = 0;

  static AudioCache player = AudioCache();

  _CountdownState(
    this.round,
    this.rounds,
    this.points1,
    this.points2,
    this.nextteam,
  ) {
    player.play('countdown.mp3');
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds -= 1;
      });
      if (_seconds <= 0) {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Game(round, rounds, points1, points2, nextteam),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Charader"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(4),
                child: Text(
                  "Lag $nextteam",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.all(4),
                child: Text(
                  "Runda $round/$rounds",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Text(
              "0:0$_seconds",
              style: TextStyle(fontSize: 75, fontWeight: FontWeight.w900),
            ),
          )
        ],
      ),
    );
  }
}
