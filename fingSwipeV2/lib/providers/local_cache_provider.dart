import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalScoreProvider {
  Future<bool> storeToCache(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool done = await prefs.setInt('storedScore', score);
    return done;
  }
}
