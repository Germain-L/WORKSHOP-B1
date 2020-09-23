import 'package:flutter/material.dart';

import '../../models/local_cache_provider.dart';

class DisplayedScore extends StatelessWidget {
  final int score;
  final String scoreType;

  const DisplayedScore({Key key, this.score, this.scoreType}) : super(key: key);

  static final LocalScore localScore = LocalScore();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF000000), width: 2.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            scoreType,
            style: TextStyle(fontSize: 33),
          ),
          Text(
            score.toString(),
            style: TextStyle(fontSize: 50),
          ),
        ],
      ),
    );
  }
}
