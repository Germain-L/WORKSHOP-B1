import 'package:fingSwipeV2/pages/app.dart';
import 'package:fingSwipeV2/providers/game_provider.dart';
import 'package:fingSwipeV2/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(backgroundColor: Color(0xffEEEEEE)),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Nav()),
          ChangeNotifierProvider(create: (context) => Game())
        ],
        child: App(),
      ),
    ),
  );
}
