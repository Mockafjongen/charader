import 'package:charader/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WinScreen extends StatelessWidget {
  var points1 = 0;
  var points2 = 0;

  var winteam = 0;
  WinScreen(this.points1, this.points2) {
    if (points1 > points2) {
      winteam = 1;
    } else if (points2 > points1) {
      winteam = 2;
    } else {
      winteam = 0;
    }
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
          Container(
              margin: EdgeInsets.only(top: 40),
              alignment: Alignment.center,
              child: Text(
                winteam != 0 ? "Vinnaren är:" : "Oavgjort!",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w300),
              )),
          Container(
            child: Text(
              winteam != 0 ? "Lag $winteam" : "",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
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
                margin: EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainMenu(),
                            ),
                          );
                        },
                        child: Text(
                          "Igen",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        },
                        child: Text(
                          "Avsluta",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
