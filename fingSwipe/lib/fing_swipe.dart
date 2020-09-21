import 'package:fingSwipe/pages/landing.dart';
import 'package:fingSwipe/providers/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/game.dart';

class FingSwipe extends StatefulWidget {
  @override
  _FingSwipeState createState() => _FingSwipeState();
}

class _FingSwipeState extends State<FingSwipe> {

  List<Widget> currentPage = [
    LandingPage(),
    FingSwipeGame(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<Navigation>(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffEEEEEE),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'FingSwipe',
                style: TextStyle(fontSize: 25, color: Colors.black),
              )
            ],
          ),
        ),
        body: currentPage[navigation.currentPage]
      ),
    );
  }
}
