import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/app.dart';
import 'providers/game_provider.dart';
import 'providers/navigation_provider.dart';

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
