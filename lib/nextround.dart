import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'countdown.dart';

class NextRound extends StatelessWidget {
  var round = 0;
  var rounds = 0;

  var points1 = 0;
  var points2 = 0;

  var nextteam = 1;

  NextRound(
    this.round,
    this.rounds,
    this.points1,
    this.points2,
    this.nextteam,
  );

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
          Container(
            alignment: Alignment.topRight,
            child: Text(
              "Runda $round/$rounds",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Text(
              "Nästa Runda",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              "Lag $nextteam",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Lag 1",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "$points1",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Lag 2",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "$points2",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 300,
                height: 50,
                margin: EdgeInsets.only(bottom: 60),
                child: ElevatedButton(
                  child: Text(
                    "Nästa Runda",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Countdown(
                            round, rounds, points1, points2, nextteam),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
