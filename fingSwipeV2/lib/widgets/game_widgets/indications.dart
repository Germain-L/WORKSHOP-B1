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
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: game.currentArrowDirection,
            child: SvgPicture.asset(
              'assets/arrow.svg',
              fit: BoxFit.scaleDown,
              height: 100,
              color: game.arrowColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            game.currentWordDirection,
            style: TextStyle(fontSize: 35, color: game.wordColor),
          ),
        ],
      ),
    );
  }
}
