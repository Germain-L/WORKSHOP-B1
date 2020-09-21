import 'package:fingSwipeV2/providers/game_provider.dart';
import 'package:fingSwipeV2/widgets/game_widgets/indications.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                game.currentSwipeMode,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 200),
              Indications(),
            ],
          ),
        ],
      ),
    );
  }
}
