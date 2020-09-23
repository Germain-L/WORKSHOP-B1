import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../providers/game_provider.dart';

class Indications extends StatefulWidget {
  @override
  _IndicationsState createState() => _IndicationsState();
}

class _IndicationsState extends State<Indications> {
  
  int progress_value = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(milliseconds: 1), (Timer timer) {
      setState(() {
        if (progress_value == 1000) progress_value = 0;
        progress_value++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);

    double _anw = 0.0;
    double _anh = 0.0;

    if (game.win) {
      _anw = 300.0;
      _anh = 300.0;
    }

    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          border: Border.all(width: 3),
      ),
      child: Stack(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: FAProgressBar(
              maxValue: 1000,
              size: 300,
              direction: Axis.horizontal,
              verticalDirection: VerticalDirection.up,
              currentValue: progress_value,
              progressColor: Color(0xFFEEEEEE),
              borderRadius: 0,
              animatedDuration: Duration(milliseconds: 0),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  width: _anw,
                  height: _anh,
                  decoration: BoxDecoration(
                    color: Color(0xFF20E692),
                  ),
                  duration: Duration(milliseconds: 1),
                  curve: Curves.fastOutSlowIn,
                ),
                if (!game.win)
                  Transform.rotate(
                    angle: game.currentArrowDirection - (pi / 2),
                    child: SvgPicture.asset(
                      'assets/arrow.svg',
                      fit: BoxFit.scaleDown,
                      height: 100,
                      color: game.arrowColor,
                    ),
                  ),
                if (!game.win) SizedBox(height: 10),
                if (!game.win)
                  Text(
                    game.currentWordDirection,
                    style: TextStyle(fontSize: 35, color: game.wordColor),
                  ),
              ],
            ),
          ),
          if (!game.win)
            Transform.rotate(
              angle: game.currentArrowDirection - (pi / 2),
              child: SvgPicture.asset(
                'assets/arrow.svg',
                fit: BoxFit.scaleDown,
                height: 100,
                color: game.arrowColor,
              ),
            ),
          if (!game.win) SizedBox(height: 10),
          if (!game.win)
            Text(
              game.currentWordDirection,
              style: TextStyle(fontSize: 35, color: game.wordColor),
            ),
        ],
      ),
    );
  }
}
