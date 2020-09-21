import 'dart:math';

import 'package:flutter/cupertino.dart';

class Game with ChangeNotifier {
  final Random random = Random();

  int score;

  List swipeModes = ["Arrows!", "Text!"];

  List arrowDirections = [
    0, //right
    (3 * pi) / 2, //bottom
    pi, //left
    pi / 2, // top
  ];

  List wordDirection = [
    "Right",
    "Bottom",
    "Left",
    "Top",
  ];

  int absoluteDirection = 0; //direction given with an index for the list
  int previousAbsoluteDirection = 0;

  String currentSwipeMode = "Arrows!";
  String currentWordDirection = "Right";
  num currentArrowDirection = pi;

  Duration timeGivenToSwipe = Duration(milliseconds: 3000);

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
      
      await Future.delayed(timeGivenToSwipe);
      absoluteDirection = previousAbsoluteDirection;
    }
  }
}
