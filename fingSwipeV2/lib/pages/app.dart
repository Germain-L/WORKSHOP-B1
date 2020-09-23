import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/core_widgets/appbar.dart';
import 'game.dart';
import 'menu.dart';
import 'end/normal.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(),
          // body: pages.elementAt(nav.currentPage),
        ),
      ],
    );
  }
}
