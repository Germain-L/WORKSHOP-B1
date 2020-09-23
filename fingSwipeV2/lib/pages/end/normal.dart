import 'package:fingSwipeV2/providers/game_provider.dart';
import 'package:fingSwipeV2/widgets/core_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NormalEnd extends StatefulWidget {

  @override
  _NormalEndState createState() => _NormalEndState();
}

class _NormalEndState extends State<NormalEnd> {

  @override
  Widget build(BuildContext context) {

    var game = Provider.of<Game>(context);
    
    return Scaffold(
      appBar: CustomAppBar(),
      body: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    top: BorderSide(width: 2.0, color: Color(0xFF000000)),
                    left: BorderSide(width: 2.0, color: Color(0xFF000000)),
                    right: BorderSide(width: 2.0, color: Color(0xFF000000)),
                    bottom: BorderSide(width: 2.0, color: Color(0xFF000000)),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "BEST SCORE",
                      style: TextStyle(fontSize: 33),
                    ),
                    Text(
                      "90",
                      style: TextStyle(fontSize: 50),
                    ),
                  ]
                ),
              ),
              Container(
                padding: const EdgeInsets.all(25.0),
                margin: const EdgeInsets.only(top: 35.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    top: BorderSide(width: 2.0, color: Color(0xFF000000)),
                    left: BorderSide(width: 2.0, color: Color(0xFF000000)),
                    right: BorderSide(width: 2.0, color: Color(0xFF000000)),
                    bottom: BorderSide(width: 2.0, color: Color(0xFF000000)),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "LAST SCORE",
                      style: TextStyle(fontSize: 33),
                    ),
                    Text(
                      game.score.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                  ]
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child:
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: Color(0xFFEEEEEE),
                    textColor: Color(0xFF0E0E0E),
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.only(bottom: 15.0, top: 15.0, left: 25.0, right: 25.0),
                    splashColor: Color(0xFFEDEDED),
                    onPressed: () {
                      /*...*/
                    },
                    child: Text(
                      "Add on leaderboard",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 25.0),
                child:
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: Color(0xFF000000),
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.only(bottom: 15.0, top: 15.0, left: 25.0, right: 25.0),
                    splashColor: Color(0xFF1F1F1F),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, 'menu', (route) => false);
                    },
                    child: Text(
                      "Play Again",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
              ),
            ],
          ),
        )
      ),
    );
  }
}