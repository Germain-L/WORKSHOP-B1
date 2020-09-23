import 'package:fingSwipeV2/models/leaderboard_score.dart';
import 'package:fingSwipeV2/providers/score_provider.dart';
import 'package:fingSwipeV2/widgets/core_widgets/appbar.dart';
import 'package:fingSwipeV2/widgets/leaderboard/score_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final score = Provider.of<Score>(context);
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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Leaderboard",
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder<List<LeaderboardScore>>(
              future: score.getAll(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<LeaderboardScore>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ScoreWidget(
                        score: snapshot.data[index].score,
                        name: snapshot.data[index].name,
                        rank: index,
                      );
                    },
                  );
                }
                return Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Loading scores ...",
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
