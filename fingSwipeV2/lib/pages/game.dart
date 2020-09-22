import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';

import '../providers/game_provider.dart';
import '../widgets/game_widgets/indications.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool isStarted = false;

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);

    if (!isStarted) {
      game.runGame();
      setState(() {
        isStarted = true;
      });
    }

    return SizedBox.expand(
      child: SwipeDetector(
        onSwipeRight: (){
          game.check(0);
        },
        onSwipeDown: (){
          game.check(1);
        },
        onSwipeLeft: (){
          game.check(2);
        },
        onSwipeUp: (){
          game.check(3);
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(game.score.toString()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      game.currentSwipeMode,
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 200),
                    Indications(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
