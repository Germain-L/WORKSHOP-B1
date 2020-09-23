import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';
import '../widgets/core_widgets/appbar.dart';
import 'game.dart';
import 'menu.dart';
import 'end/normal.dart';

class App extends StatelessWidget {
  final List<Widget> pages = [
    MenuPage(),
    GamePage(),
    NormalEnd(),
  ];
  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<Nav>(context);
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(),
          body: pages.elementAt(nav.currentPage),
        ),
      ],
    );
  }
}
