import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:swipedetector/swipedetector.dart';

import '../providers/game_provider.dart';
import '../widgets/game_widgets/indications.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool isStarted = false;

  String dir = "";

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
      child: SimpleGestureDetector(
        swipeConfig: SimpleSwipeConfig(
            horizontalThreshold: 0,
            verticalThreshold: 0,
            swipeDetectionBehavior: SwipeDetectionBehavior.singular),
        onHorizontalSwipe: (SwipeDirection direction) {
          if (direction == SwipeDirection.right) {
            print("Swipe Right");
            setState(() {
              dir = "Right";
            });
          }
          if (direction == SwipeDirection.left) {
            print("Swipe Left");
            setState(() {
              dir = "Left";
            });
          }
        },

        onVerticalSwipe: (SwipeDirection direction) {
          if (direction == SwipeDirection.up) {
            print("Swipe up");
            setState(() {
              dir = "Up";
            });
          }
          if (direction == SwipeDirection.down) {
            print("Swipe down");
            setState(() {
              dir = "Down";
            });
          }
        },
        // onSwipeUp: (){
        //   print("Up");
        //   game.check(0);
        // },
        // onSwipeRight: (){
        //   print("Right");
        //   game.check(1);
        // },
        // onSwipeDown: (){
        //   print("Down");
        //   game.check(2);
        // },
        // onSwipeLeft: (){
        //   print("Left");
        //   game.check(3);
        // },
        child: Row(
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
                SizedBox(height: 20,),
                Text(
                  "Swipe where indicated !",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20,),
                Indications(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}