import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: mainApp(),
  ));
}

class mainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: MaterialButton(
                padding: EdgeInsets.all(50),
                color: Colors.white,
                shape: CircleBorder(),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => gamePage()));
                },
                child: Text(
                  "Start",
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
          ),
          Container(
              color: Colors.redAccent,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: MaterialButton(
                  padding: EdgeInsets.all(50),
                  color: Colors.white,
                  shape: CircleBorder(),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => gamePage()));
                  },
                  child: Text(
                    "Start",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class gamePage extends StatefulWidget {
  @override
  State<gamePage> createState() => _gamePageState();
}

class _gamePageState extends State<gamePage> {
  double blueCardHeight = 0;
  double redCardHeight = 0;

  int playerAScore = 0;
  int playerBScore = 0;

  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      blueCardHeight = MediaQuery.of(context).size.height / 2;
      redCardHeight = MediaQuery.of(context).size.height / 2;
      initialized = true;
    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              setState(() {
                playerBScore = playerBScore + 5;
                blueCardHeight = blueCardHeight + 30;
                redCardHeight = redCardHeight - 30;
              });

              double winningHeight = MediaQuery.of(context).size.height - 60;

              print(blueCardHeight);
              print(winningHeight);

              if (blueCardHeight > winningHeight) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => resultPage(playerBScore,"PLAYER B")));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.all(25),
              color: Colors.blueAccent,
              height: blueCardHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Player B",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  Text(playerBScore.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800))
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                playerAScore = playerAScore + 5;
                redCardHeight = redCardHeight + 30;
                blueCardHeight = blueCardHeight - 30;
              });

              double maxHeight = MediaQuery.of(context).size.height - 60;

              print(redCardHeight);
              print(maxHeight);

              if (redCardHeight > maxHeight) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => resultPage(playerAScore,"PLAYER A")));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.all(25),
              color: Colors.redAccent,
              height: redCardHeight,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Player A",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    Text(playerAScore.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

class resultPage extends StatelessWidget {

  int score = 0;
  String player = "";

  resultPage(this.score,this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "PLAYER A" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            Text(
              player+" WON",
              style: TextStyle(fontSize: 35),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.white,
              child: Text("Restart Game"),
            )
          ],
        ),
      ),
    );
  }
}
