import 'package:flutter/cupertino.dart';

class Nav with ChangeNotifier {
  
  // DEBUG
  int currentPage = 2;
  
  void changePage(int newPage) {
    currentPage = newPage;
    
    notifyListeners();
  }
}