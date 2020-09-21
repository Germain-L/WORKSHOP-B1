import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

class FingSwipeGame extends StatefulWidget {
  @override
  _FingSwipeGameState createState() => _FingSwipeGameState();
}

class _FingSwipeGameState extends State<FingSwipeGame> {
  String swipedirection = "Start";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SwipeDetector(
        onSwipeDown: () {
          print('Down');
          setState(() {
            swipedirection = "Down";
          });
        },
        onSwipeUp: () {
          print('Up');
          setState(() {
            swipedirection = "Up";
          });
        },
        onSwipeLeft: () {
          print('Left');
          setState(() {
            swipedirection = "Left";
          });
        },
        onSwipeRight: () {
          print('right');
          setState(() {
            swipedirection = "Right";
          });
        },
        child: SizedBox.expand(
          child: Text(
            swipedirection,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
