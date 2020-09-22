import 'package:flutter/cupertino.dart';

class Nav with ChangeNotifier {
  int currentPage = 0;

  Image bg1 = Image.asset('assets/bg1.png' , fit: BoxFit.fitWidth,);
  Image bg2 = Image.asset('assets/bg2.png', fit: BoxFit.fitWidth,);

  Image currentBg = Image.asset('assets/bg1.png', fit: BoxFit.fitWidth,);

  void changePage(int newPage) {
    currentPage = newPage;

    if (currentPage == 0) {
      currentBg = bg1;
    } else if (currentPage == 1) {
      currentBg = bg2;
    }
    
    notifyListeners();
  }
}