import 'dart:ui';
import 'package:flame/game/game.dart';

class FingSwipe extends Game {
  Size screenSize;
  double tileSize;

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xffEEEEEE);
    canvas.drawRect(bgRect, bgPaint);
  }

  @override
  void update(double t) {}

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }
}
