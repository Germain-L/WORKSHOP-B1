import 'dart:async';

import 'package:fingSwipeV2/widgets/leaderboard/list.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../models/leaderboard_score.dart';
import '../models/score_provider.dart';
import '../widgets/core_widgets/appbar.dart';
import '../widgets/leaderboard/score_widget.dart';
import '../widgets/leaderboard/loading.dart';

class LeaderboardPageBroken extends StatefulWidget {
  @override
  _LeaderboardPageBrokenState createState() => _LeaderboardPageBrokenState();
}

class _LeaderboardPageBrokenState extends State<LeaderboardPageBroken> {
  final Score score = Score();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, 'menu', (route) => false);
        },
        label: Text('Menu'),
        icon: Icon(LineIcons.arrow_left),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
//           Container(
//             padding: const EdgeInsets.only(left: 25.0, top: 15),
//             child: Text(
//               """
// LEADER
// BOARD""",
//               style: TextStyle(color: Color(0xff6FC3BC), fontSize: 90, fontWeight: FontWeight.w900),
//             ),
//           ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FutureBuilder<List<LeaderboardScore>>(
              future: score.getAll(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {

                  List<LeaderboardScore> scoresRaw = snapshot.data;
                  List<ScoreWidget> scoresProcessed = [];

                  for (int i = 0; i < scoresRaw.length; i++) {
                    scoresProcessed.add(ScoreWidget(
                      name: scoresRaw[i].name,
                      score: scoresRaw[i].score,
                      rank: i,
                    ));
                  }

                  return LeaderboardList(scores: scoresProcessed);
                }
                return Loading();
              },
            ),
          ),
        ],
      ),
    );
  }
}
