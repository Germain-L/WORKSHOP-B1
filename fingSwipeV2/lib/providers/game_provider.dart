import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game with ChangeNotifier {
  final Random random = Random();

  int score = 0;

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

  String currentSwipeMode = "Arrows!";
  String currentWordDirection = "Right";
  num currentArrowDirection = pi / 2;

  Color arrowColor = Color(0xff62C980);
  Color wordColor = Colors.black;

  Duration timeGivenToSwipe = Duration(milliseconds: 1000);

  void changeSwipeMode() {
    currentSwipeMode == swipeModes[0]
        ? currentSwipeMode = swipeModes[1]
        : currentSwipeMode = swipeModes[0];
    notifyListeners();
  }

  void scoreUp() {
    score++;
    notifyListeners();
  }

  void runGame() async {
    while (true) {
      List availableIndices = [0, 1, 2, 3];

      availableIndices.remove(previousAbsoluteDirection);
      absoluteDirection = availableIndices[random.nextInt(3)];


      if (currentSwipeMode == swipeModes[0]) {
        //arrows
        currentArrowDirection = arrowDirections[absoluteDirection];

        currentWordDirection = wordDirections[random.nextInt(4)];
      } else if (currentSwipeMode == swipeModes[1]) {
        //text
        currentWordDirection = wordDirections[absoluteDirection];

        currentArrowDirection = arrowDirections[random.nextInt(4)];
      }

      changeColor();

      notifyListeners();
      await Future.delayed(timeGivenToSwipe);
      absoluteDirection = previousAbsoluteDirection;
    }
  }

  void check(int direction) {
    if (direction == absoluteDirection) {
      scoreUp();
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
