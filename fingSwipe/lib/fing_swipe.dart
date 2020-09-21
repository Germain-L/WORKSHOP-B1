import 'package:fingSwipe/providers/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FingSwipe extends StatefulWidget {
  @override
  _FingSwipeState createState() => _FingSwipeState();
}

class _FingSwipeState extends State<FingSwipe> {
  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<Navigation>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffEEEEEE),
          title: Text("FingSwipe"),
        ),
        body: navigation.currentPage
      ),
    );
  }
}
