import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game with ChangeNotifier {
  final Random random = Random();

  bool isAlive = true;

  int score = 0;
  int previousScore = 0;

  List swipeModes = ["Arrows!", "Text!"];

  List<double> arrowDirections = [
    (0 * pi / 180).toDouble(), //top
    (90 * pi / 180).toDouble(), //right
    (180 * pi / 180).toDouble(), //bottom
    (270 * pi / 180).toDouble(), // left
  ];

  List<String> wordDirections = [
    "Top",
    "Right",
    "Bottom",
    "Left",
  ];

  int absoluteDirection = 0; //direction given with an index for the list
  int previousAbsoluteDirection = 0;

  int absoluteWrongDirection = 0;
  int previousWrongDirection = 0;

  String currentSwipeMode = "Arrows!";
  String currentWordDirection = "Right";
  num currentArrowDirection = pi / 2;

  Color arrowColor = Color(0xff62C980);
  Color wordColor = Colors.black;

  Duration timeGivenToSwipe = Duration(milliseconds: 500);

  void runGame() async {
    while (isAlive) {
      changeDirection();
      if (score % 5 == 0 && score > 1) {
        changeSwipeMode();
      }
      if (score == previousScore) {
        isAlive = false;
      }

      await Future.delayed(timeGivenToSwipe);
      previousAbsoluteDirection = absoluteDirection;
      previousWrongDirection = absoluteWrongDirection;
    }

    notifyListeners();
  }

  void changeSwipeMode() {
    currentSwipeMode == swipeModes[0]
        ? currentSwipeMode = swipeModes[1]
        : currentSwipeMode = swipeModes[0];
  }

  void changeDirection() {
    List allAbsDirs = [0, 1, 2, 3];
    allAbsDirs.remove(previousAbsoluteDirection);
    absoluteDirection = allAbsDirs[random.nextInt(3)];

    List allWrongDirs = [0, 1, 2, 3];
    allWrongDirs.remove(previousWrongDirection);
    allWrongDirs.remove(absoluteDirection);

    absoluteWrongDirection = allWrongDirs[random.nextInt(2)];

    if (swipeModes == swipeModes[0]) {
      // in arrow mode, change arrow to correct dir and word to a wrong dir
      currentArrowDirection = arrowDirections[absoluteDirection];
      currentWordDirection = wordDirections[absoluteWrongDirection];
    } else if (swipeModes == swipeModes[1]) {
      // in word mode, change word to correct dir and arrow to a wrong dir
      currentWordDirection = wordDirections[absoluteDirection];
      currentArrowDirection = arrowDirections[absoluteWrongDirection];
    }
  }

  void check(int direction) {
    if (direction == absoluteDirection) {
      score++;
    } else {
      isAlive = false;
    }
    notifyListeners();
  }

  void changeColor() {
    bool ran = random.nextBool();
    if (ran) {
      arrowColor = Color(0xff62C980);
      wordColor = Colors.black;
    } else {
      wordColor = Color(0xff62C980);
      arrowColor = Colors.black;
    }

    notifyListeners();
  }
}
