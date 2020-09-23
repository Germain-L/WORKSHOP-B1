import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/local_cache_provider.dart';
import '../models/score_provider.dart';
import '../providers/game_provider.dart';
import '../widgets/core_widgets/appbar.dart';
import '../widgets/end_game/eng_game_buttons.dart';
import '../widgets/end_game/score.dart';

class NormalEnd extends StatefulWidget {
  @override
  _NormalEndState createState() => _NormalEndState();
}

class _NormalEndState extends State<NormalEnd> {
  LocalScore localScore = LocalScore();
  Score score = Score();

  @override
  void initState() {
    super.initState();
  }

  bool stored = false;

  @override
  Widget build(BuildContext context) {
    var game = Provider.of<Game>(context);

    if (stored == false) {
      localScore.storeToCache(game.score);
      setState(() {
        stored = true;
      });
    }

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              FutureBuilder<int>(
                future: localScore.getHighScore(),
                builder: (context, snapshot) {
                  return DisplayedScore(
                    scoreType: 'BEST SCORE',
                    score: snapshot.data,
                  );
                }
              ),

              DisplayedScore(
                scoreType: 'LAST SCORE',
                score: game.score,
              ),

              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: Color(0xFFEEEEEE),
                  textColor: Color(0xFF0E0E0E),
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.only(
                      bottom: 15.0, top: 15.0, left: 25.0, right: 25.0),
                  splashColor: Color(0xFFEDEDED),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        TextEditingController nameController =
                            TextEditingController();
                        return AlertDialog(
                          title: Text("Enter name:"),
                          content: TextField(
                            controller: nameController,
                            autocorrect: true,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: "Name",
                            ),
                            onSubmitted: (String newName) {
                              score.store(nameController.text, game.score);
                              Navigator.pop(context);
                            },
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                score.store(nameController.text, game.score);
                                Navigator.pop(context);
                              },
                              child: Text('Submit'),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "Add on leaderboard",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),

              EndGameButtons(
                text: 'PLAY AGAIN',
                route: 'normalGame',
              ),
              
              EndGameButtons(
                text: 'MAIN MENU',
                route: 'menu',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
