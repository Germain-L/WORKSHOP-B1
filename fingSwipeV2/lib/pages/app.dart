import 'package:fingSwipeV2/pages/game.dart';
import 'package:fingSwipeV2/widgets/core_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../providers/navigation_provider.dart';
import 'menu.dart';

class App extends StatelessWidget {
  final List<Widget> pages = [
    MenuPage(),
    GamePage(),
  ];
  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<Nav>(context);
    return Scaffold(
      appBar: CustomAppBar(),
      body: pages.elementAt(nav.currentPage),
    );
  }
}
