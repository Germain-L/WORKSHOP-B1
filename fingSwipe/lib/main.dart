import 'package:fingSwipe/pages/game.dart';
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
    return ChangeNotifierProvider(
      create: (context) => Navigation(),
      child: FingSwipe(),
    );
  }
}