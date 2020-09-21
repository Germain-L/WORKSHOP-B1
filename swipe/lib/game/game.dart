import 'dart:ui';
import 'package:flame/game/game.dart';
import 'package:flame/flame.dart';
import 'package:swipe/Components/square.dart';

class FingSwipe extends Game {
  Size screenSize;
  double tileSize;
  List<SwipableSquare> swipableSquares;

  FingSwipe() {
    initialize();
  }

  void initialize() async {
    
    Flame.audio.loopLongAudio('background.mp3');

    swipableSquares = List<SwipableSquare>();
    resize(await Flame.util.initialDimensions());
    spawnSquare();
  }

  void spawnSquare() {
    swipableSquares.add(SwipableSquare(this, screenSize.width/2, screenSize.height * 0.55));
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xffEEEEEE);
    canvas.drawRect(bgRect, bgPaint);

    swipableSquares.forEach((SwipableSquare square) => square.render(canvas));
  }

  @override
  void update(double t) {
    swipableSquares.forEach((SwipableSquare square) => square.update(t));
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }
}
