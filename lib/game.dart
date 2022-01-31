import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'nextround.dart';
import 'winscreen.dart';

import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:audioplayers/audioplayers.dart';

var words = [
  "Lår",
  "Öra",
  "Trombon",
  "Älg",
  "Gevär",
  "Karate",
  "Dirigent",
  "Handled",
  "Frukost",
  "Båt",
  "Bil",
  "Flöjt",
  "Sångare",
  "Träd",
  "Tak",
  "Boxning",
  "Påfågel",
  "Källare",
  "Cigarett",
  "Låg",
  "Piano",
  "Dator",
  "Telefon",
  "Tangentbord",
  "Mus",
  "Bowling",
  "Fotboll",
  "Basket",
  "Golf",
  "Ishockey",
  "Skidor",
  "Handskar",
  "Middag",
  "Höft",
  "Kasta",
  "Sengångare",
  "Finger",
  "Gitarr",
  "Kex",
  "Lejonkungen",
  "Hög",
  "Kärlek",
  "Red Bull",
  "Väst",
  "Soffa",
  "Björn",
  "Gurka",
  "Läkare",
  "Doktor",
  "Loppa",
  "Gräshoppa",
  "Hamburgare",
  "Nyckel",
  "Rik",
  "Fattig",
  "Spade",
  "Borr",
  "Krona",
  "Tavla",
  "Buddha",
  "Pojkvän",
  "Son",
  "Dotter",
  "Flickvän",
  "Kalsonger",
  "Nykter",
  "Simma",
  "Surt",
  "Mjölk",
  "Katt",
  "Bumerang",
  "Krama",
  "Superman",
  "Kines",
  "Andas",
  "Förkyld",
  "Pirat",
  "Clown",
  "Cowboy",
  "Indian",
  "Groda",
  "Trummor",
  "Spöke",
  "Trollkarl",
  "Vampyr",
  "Orm",
  "Hund",
  "Cykla",
  "Hopprep",
  "Tandborste",
  "Dammsugare",
  "Bebis",
  "Frisör",
  "Tjuv",
  "Balett",
  "Dansa",
  "Måla",
  "Massera",
  "Fiska",
  "Snöboll",
  "Paraply",
  "Snickare",
  "Frysa",
  "Svettas",
  "Ledsen",
  "Glad",
  "Arg",
  "Sur",
  "Yr",
  "Full",
  "Blind",
  "Döv",
  "Fågel",
  "Kamera",
  "Tupp",
  "Moped",
  "Öst",
  "Syd",
  "Norr",
  "Citron",
  "Ben",
  "Säng",
  "Munspel",
  "Dragspel",
  "Ballong",
  "Fönster",
  "Lampa",
  "Hatt",
  "Keps",
  "Jacka",
  "Örhänge",
  "Byxa",
  "Kjol",
  "Orientering",
  "Idiot",
  "Tennis",
  "Badminton",
  "Volleyboll",
  "Fiol",
  "Puckelpist",
  "Slalom",
  "Vasaloppet",
  "Blomma",
  "Trädgård",
  "Eld",
  "Vatten",
  "Regn",
  "Blixt",
  "Spel",
  "Klättra",
  "Svamp",
  "Kanin",
  "Grävling",
  "Fläril",
  "Yxa",
  "Hammare",
  "Skruvmejsel",
  "Fjäril",
  "Fjärrkontroll",
  "Kedja",
  "Tuta",
  "Handduk",
  "Munskydd",
  "Känguru",
  "Bord",
  "Schack",
  "Hulken",
  "Spiderman",
  "Batman",
  "Sushi",
  "BH",
  "Strumpa",
  "Kaffe",
  "Jultomte",
  "Snus",
  "Häxa",
  "Harry Potter",
  "Lasersvärd",
  "Pilbåge",
  "Hicka",
  "Gris",
  "Apa",
  "Pruttkudde",
  "Lärare",
  "Bajsa",
  "Kissa",
  "Spotta",
  "Hosta",
  "Tuggummi",
  "Pingis",
  "Breakdance",
  "Daggmask",
  "Skateboard",
  "Skridsko",
  "Hörlurar",
  "Strippa",
  "Sten",
  "Fidget Spinner",
  "Leta",
  "Torka",
  "Glasögon",
  "Läsa",
  "Död",
  "Präst",
  "Michael Jackson",
  "Rappa",
  "Skriva",
  "Glass",
  "Gravid",
  "Vakna",
  "Väckarklocka",
  "Sko",
  "Banan",
  "Fotomodell",
  "Sminka",
  "Frisbee",
  "Rida",
  "Haj",
  "Bläckfisk",
  "Spaghetti",
  "Tvilling",
  "Lady & Lufsen",
  "Kalle Anka",
  "Polis",
  "Kylskåp",
  "Stjärna",
  "Finne",
  "Teckenspråk",
  "Skrika",
  "Viska",
  "Galen",
  "Väska",
  "Kyckling",
  "Ko",
  "Kaktus",
  "Trappa",
  "Sy",
  "Champagne",
  "Thor",
  "Akrobat",
  "Tyngdlyftare",
  "Stark",
  "Tungt",
  "Curling",
  "Gammal",
  "Majskolv",
  "Spruta",
  "Vulkan",
  "Fest",
  "Regnbåge",
  "Tandläkare",
  "Glödlampa",
  "Ägg",
  "Soptunna",
  "Klumpig",
  "Pizza",
  "Fisa",
  "Pannkakor",
  "Macarena",
  "Kirurg",
  "Storm",
  "Förstoppning",
  "Bilolycka",
  "Detektiv",
  "Skämt",
  "Peruk",
  "Flygplan",
  "Robot",
  "Trampolin",
  "Mardröm",
  "Selfie",
  "Spionera",
  "Nysa",
  "Fnissa",
  "Svärd",
  "Sax",
  "Mask",
  "Berg",
  "Ryggsäck",
  "Kortspel",
  "Bok",
  "Magnet",
  "Fyrverkerier",
  "Kittla",
  "Blinka",
  "Trumpet",
  "Dyka",
  "Mygga",
  "Betala",
  "Skol",
  "Stor",
  "Alarm",
  "Kuvert",
  "Bön",
  "Äpple",
  "Snö",
  "Mikrovågsugn",
  "Puss",
  "Ficklampa",
  "Hårborste",
  "Snurra",
  "Balansera",
  "Monster",
  "Skadad",
  "Slips",
  "Skrämma",
  "Varm",
  "Moonwalk",
];

List<String> wordsleft = List.from(words);

class Game extends StatefulWidget {
  var round = 0;
  var rounds = 0;
  var points1 = 0;
  var points2 = 0;
  var nextteam = 0;

  Game(
    this.round,
    this.rounds,
    this.points1,
    this.points2,
    this.nextteam,
  );

  @override
  _GameState createState() =>
      _GameState(round, rounds, points1, points2, nextteam);
}

class _GameState extends State<Game> {
  var _seconds = 45;

  var _word = "";

  var _points = 0;

  var round = 0;
  var rounds = 0;
  var points1 = 0;
  var points2 = 0;
  var nextteam = 0;

  static AudioCache player = AudioCache();

  _GameState(
    this.round,
    this.rounds,
    this.points1,
    this.points2,
    this.nextteam,
  ) {
    _word = randomChoice(wordsleft);
    wordsleft.remove(_word);
    if (wordsleft.length <= 1) {
      wordsleft = words;
    }
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds -= 1;
      });
      if (_seconds == 3) {
        player.play('countdown.mp3');
      }
      if (_seconds <= 0) {
        timer.cancel();
        if (nextteam == 1) {
          points1 += _points;
          nextteam = 2;
        } else if (nextteam == 2) {
          points2 += _points;
          nextteam = 1;
          round += 1;
        }
        if (round <= rounds) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NextRound(round, rounds, points1, points2, nextteam),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WinScreen(points1, points2),
            ),
          );
        }
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
              _seconds > 9 ? "0:$_seconds" : "0:0$_seconds",
              style: TextStyle(fontSize: 75, fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Text(
              _word,
              style: TextStyle(fontSize: 40),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: IconButton(
                        icon: Image.asset("assets/check.png"),
                        iconSize: 160,
                        onPressed: () {
                          player.play('check.mp3');
                          _points += 1;
                          setState(() {
                            _word = randomChoice(wordsleft);
                          });
                          wordsleft.remove(_word);
                          if (wordsleft.length <= 1) {
                            wordsleft = words;
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: IconButton(
                        icon: Image.asset("assets/close.png"),
                        iconSize: 160,
                        onPressed: () {
                          player.play('skip.mp3');
                          setState(() {
                            _word = randomChoice(wordsleft);
                          });
                          wordsleft.remove(_word);
                          print(wordsleft.length);
                          if (wordsleft.length <= 1) {
                            wordsleft = words;
                          }
                        },
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
