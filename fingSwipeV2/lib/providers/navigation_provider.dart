import 'package:flutter/cupertino.dart';

class Nav with ChangeNotifier {
  int currentPage = 0;

  void changePage(int newPage) {
    currentPage = newPage;
    notifyListeners();
  }
}