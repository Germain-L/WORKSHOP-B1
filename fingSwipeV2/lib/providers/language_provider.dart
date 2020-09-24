import 'package:fingSwipeV2/main.dart';
import 'package:flutter/foundation.dart';


class LanguageProvider with ChangeNotifier {
  bool translateToFrench = false;

  void changeLanguage() {
    translateToFrench = !translateToFrench;
    notifyListeners();
  }
}