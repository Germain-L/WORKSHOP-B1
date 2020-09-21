import 'package:flutter/material.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Transform.scale(
        scale: 4,
        child: IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: (){
            
          },
        ),
      ),
    );
  }
}