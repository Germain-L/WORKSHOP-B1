import 'package:fingSwipeV2/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Indications extends StatefulWidget {
  @override
  _IndicationsState createState() => _IndicationsState();
}

class _IndicationsState extends State<Indications>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    return Transform.scale(
      scale: 5,
      child: Column(
        children: [
          Text(
            game.currentWordDirection,
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(height: 5),
          Transform.rotate(
            angle: game.currentArrowDirection,
            child: Icon(LineIcons.arrow_up),
          ),
        ],
      ),
    );
  }
}
