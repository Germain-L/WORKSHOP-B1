import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Navigation with ChangeNotifier {
  int currentPage = 0;

  void changePage(int newPage) {
    currentPage = newPage;
    notifyListeners();
  }
}