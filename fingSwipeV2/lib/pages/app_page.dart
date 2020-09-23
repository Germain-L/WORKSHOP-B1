import 'package:flutter/material.dart';

import '../widgets/core_widgets/appbar.dart';

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
