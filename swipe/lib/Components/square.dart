import 'dart:ui';

import 'package:swipe/game/game.dart';

class SwipableSquare {
  final FingSwipe game;

  Rect swipeSquare;

  Paint squarePaint;

  SwipableSquare(this.game, double x, double y) {
    swipeSquare = Rect.fromLTRB(x, y, game.tileSize, game.tileSize);
    squarePaint = Paint();
    squarePaint.color = Color(0xff052f5f);
  }
  void render(Canvas c) {
  }

  void update(double t) {

  }
}