import 'package:fingSwipeV2/providers/game_provider.dart';
import 'package:fingSwipeV2/widgets/core_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NormalEnd extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var game = Provider.of<Game>(context);

    return Scaffold(
      appBar: CustomAppBar(),
      body: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Your score :",
                style: TextStyle(fontSize: 33),
              ),
              Text(
                game.score.toString(),
                style: TextStyle(fontSize: 33),
              ),
            ],
          ),
        )
      ),
    );
  }
}