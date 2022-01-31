import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'nextround.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Charader",
    home: MaterialApp(
      home: MainMenu(),
    ),
  ));
}

class MainMenu extends StatefulWidget {
  @override
  _MainMenu createState() => _MainMenu();
}

class _MainMenu extends State<MainMenu> {
  double _currentSliderValue = 2;

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
            //alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 70, 0, 300),
            child: Text(
              "Charader",
              style: TextStyle(fontSize: 50),
            ),
          ),
          Container(
            child: Text(
              "Rundor",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Slider(
            value: _currentSliderValue,
            max: 10,
            min: 1,
            divisions: 9,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 60),
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NextRound(1, _currentSliderValue.round(), 0, 0, 1),
                      ),
                    );
                  },
                  child: Text("Start"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
