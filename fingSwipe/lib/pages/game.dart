import 'dart:math';

import 'package:fingSwipe/providers/game_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';

class FingSwipeGame extends StatefulWidget {
  @override
  _FingSwipeGameState createState() => _FingSwipeGameState();
}

class _FingSwipeGameState extends State<FingSwipeGame> {
  bool start = true;

  void check(int directionIndex) {}

  @override
  Widget build(BuildContext context) {
    final gameSettings = Provider.of<GameSettings>(context);
    if (start) {
      print("started");
      gameSettings.startGame();
      setState(() {
        start = false;
      });
    }
    return Container(
      child: SwipeDetector(
        onSwipeUp: () {
          gameSettings.check(0);
        },
        onSwipeRight: () {
          gameSettings.check(2);
        },
        onSwipeDown: () {
          gameSettings.check(2);
        },
        onSwipeLeft: () {
          gameSettings.check(3);
        },
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Score: ${gameSettings.score}",
                style: TextStyle(fontSize: 55),
              ),
              Text(
                gameSettings.currentMode ?? "",
                style: TextStyle(fontSize: 50, color: Colors.black),
              ),
              Text(gameSettings.textDirections[gameSettings.currentTextIndex]),
              SizedBox(height: 100),
              Transform.rotate(
                // TODO: make this cleaner
                angle: gameSettings
                        .arrowOrientation[gameSettings.currentArrowIndex] *
                    pi /
                    180,
                child: Transform.scale(
                  scale: 7,
                  child: Icon(Icons.arrow_upward),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
