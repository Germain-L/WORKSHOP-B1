import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider.dart';

class Indications extends StatefulWidget {
  @override
  _IndicationsState createState() => _IndicationsState();
}

class _IndicationsState extends State<Indications> {
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
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            width: _anw,
            height: _anh,
            decoration: BoxDecoration(
              color: Color(0xFF20E692),
              borderRadius: BorderRadius.circular(23),
            ),
            duration: Duration(milliseconds: 500),
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
    );
  }
}
