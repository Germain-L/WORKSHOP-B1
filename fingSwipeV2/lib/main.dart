
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'models/leaderboard_score.dart';
import 'pages/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/app.dart';
import 'pages/end/normal.dart';
import 'pages/game.dart';
import 'pages/menu.dart';
import 'providers/game_provider.dart';
import 'providers/local_cache_provider.dart';
import 'providers/score_provider.dart';


AudioPlayer audioPlayer = new AudioPlayer();
var ap = new AudioCache(fixedPlayer: audioPlayer);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ap.clearCache();
  // await ap.loop('music/background.mp3', isNotification: false);
  // await ap.play('music/background.mp3', isNotification: false);
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


