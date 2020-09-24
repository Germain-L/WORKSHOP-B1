
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/end_game_page.dart';
import 'pages/game_page.dart';
import 'pages/leaderboard_page.dart';
import 'pages/menu_page.dart';
import 'providers/game_provider.dart';


AudioPlayer audioPlayer = new AudioPlayer();
var ap = new AudioCache(fixedPlayer: audioPlayer);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Game(),
        ),
      ],
      child: MaterialApp(
        routes: {
          'menu':  (context) => MenuPage(),
          'normalGame': (context) => GamePage(),
          'normalEnd': (context) => NormalEnd(),
          'leaderboard': (context) => LeaderboardPage(),
        },
        theme: ThemeData(backgroundColor: Color(0xffEEEEEE)),
        home: MenuPage(),
      ),
    ),
  );
}


