import 'package:fingSwipe/providers/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<Navigation>(context);
    return Center(
      child: Transform.scale(
        scale: 4,
        child: IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            navigation.changePage(1);
          },
        ),
      ),
    );
  }
}