import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Score with ChangeNotifier {

  void store(String username, int score) async
  {
    var result = await http.post(
        "https://fingswipe.app/api/score",
         body: {
           "username": username,
           "score": score
         }
    );
  }

  void getAll() {
    var result = http.get(
        "https://fingswipe.app/api/getAll",
    );
  }

}