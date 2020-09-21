import 'package:fingSwipe/pages/game.dart';
import 'package:fingSwipe/providers/game_settings.dart';
import 'package:fingSwipe/providers/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fing_swipe.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create: (context) => Navigation(),
        ),
        ChangeNotifierProvider(
          create: (context) => GameSettings(),
        ),
      ],
      child: FingSwipe(),
    );
  }
}