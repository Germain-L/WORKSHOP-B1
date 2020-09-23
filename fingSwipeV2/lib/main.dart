
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/app.dart';
import 'pages/end/normal.dart';
import 'pages/game.dart';
import 'pages/menu.dart';
import 'providers/game_provider.dart';
import 'providers/local_cache_provider.dart';
import 'providers/score_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Game(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocalScoreProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Score(),
        )
      ],
      child: MaterialApp(
        routes: {
          'menu':  (context) => MenuPage(),
          'normalGame': (context) => GamePage(),
          'normalEnd': (context) => NormalEnd()
        },
        theme: ThemeData(backgroundColor: Color(0xffEEEEEE)),
        home: MenuPage(),
      ),
    ),
  );
}
