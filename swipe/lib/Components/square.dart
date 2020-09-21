import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:swipe/game/game.dart';

class SwipableSquare {
  final FingSwipe game;

  Rect swipeSquare;

  Paint squarePaint;

  SwipableSquare(this.game, double x, double y) {
    swipeSquare = Rect.fromCenter(
      center: Offset(x, y),
      height: 200,
      width: 200,
    );
    squarePaint = Paint();
    squarePaint.color = Color(0xff052f5f);
  }

  void render(Canvas c) {
    c.drawRect(swipeSquare, squarePaint);
  }

  void update(double t) {}
}
