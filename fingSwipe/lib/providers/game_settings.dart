import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class GameSettings with ChangeNotifier {
  Random _random = Random();
  int score = 1;

  List<String> gameModes = ["Flèches!", "Texte!"];
  String currentMode;

  bool isAlive = true;

  List<int> arrowOrientation = [0, 90, 180, 270];
  List<String> textDirections = ["Haut", "Droite", "Bas", "Gauche"];

  int currentArrowIndex = 0;
  int currentTextIndex = 3;

  Future<void> startGame() async {
    currentMode = gameModes[0];
    while (isAlive) {
      currentArrowIndex = _random.nextInt(4);
      currentTextIndex = _random.nextInt(4);
      await Future.delayed(Duration(milliseconds: 1500));

      if (score % 5 == 0) {
        //TODO: keeps changing if not scored
        currentMode == gameModes[0]
            ? currentMode = gameModes[1]
            : currentMode = gameModes[0];
      }

      notifyListeners();
    }
  }

  void check(int directionIndex) {
    
    if (currentMode == "Flèches!") {
      if (currentArrowIndex == directionIndex) {
        scoreUp();
      }
    } else if (currentMode == "Texte!") {
      if (currentTextIndex == directionIndex) {
        scoreUp();
      }
    }

    notifyListeners();
  }

  void scoreUp() {
    score++;
    notifyListeners();
  }
}
