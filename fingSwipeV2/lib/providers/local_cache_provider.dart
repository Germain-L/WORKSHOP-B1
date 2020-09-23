import 'package:shared_preferences/shared_preferences.dart';

class LocalScore {
  Future<bool> storeToCache(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int previousHighScore = prefs.get('storedScore');

    bool setNewScore = false;
    
    if (previousHighScore < score) {
      bool setNewScore = await prefs.setInt('storedScore', score);
    }

    return setNewScore;
  }

  Future<int> getHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('storedScore')) {
      return prefs.getInt('storedScore');
    } else {
      return 0;
    }
  }
}
