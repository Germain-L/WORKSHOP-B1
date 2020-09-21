import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../pages/game.dart';
import '../pages/landing.dart';

class Navigation with ChangeNotifier {
  List<Widget> pages = [LandingPage(), FingSwipeGame()];

  Widget currentPage = LandingPage();

  void changePage(int newPage) {
    currentPage = pages[newPage];
    notifyListeners();
  }
}