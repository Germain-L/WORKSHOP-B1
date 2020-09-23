import 'package:fingSwipeV2/providers/navigation_provider.dart';
import 'package:fingSwipeV2/widgets/core_widgets/appbar.dart';
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
  bool start = true;

  void startToFalse() {
    setState(() => start = false);
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    

    if (game.finished == true) {
      Navigator.pushNamed(context, 'normalEnd');
    }

    if (start == true) {
      game.runGame();
      startToFalse();
    }


    return Scaffold(
      appBar: CustomAppBar(),
      body: SizedBox.expand(
        child: SimpleGestureDetector(
          swipeConfig: SimpleSwipeConfig(
            horizontalThreshold: 0,
            verticalThreshold: 0,
            swipeDetectionBehavior: SwipeDetectionBehavior.singular,
          ),
          onHorizontalSwipe: (SwipeDirection direction) {
            if (direction == SwipeDirection.right) {
              game.check(1);
            }
            if (direction == SwipeDirection.left) {
              game.check(3);
            }
          },
          onVerticalSwipe: (SwipeDirection direction) {
            if (direction == SwipeDirection.up) {
              game.check(0);
            }
            if (direction == SwipeDirection.down) {
              game.check(2);
            }
          },
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
                    game.score.toString(),
                    style: TextStyle(fontSize: 33),
                  ),
                  Text(
                    game.currentSwipeMode,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Swipe where indicated !",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Indications(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
