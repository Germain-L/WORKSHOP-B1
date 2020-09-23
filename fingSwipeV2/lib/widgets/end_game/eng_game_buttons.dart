import 'package:flutter/material.dart';

class EndGameButtons extends StatelessWidget {
  final String text;
  final String route;

  const EndGameButtons({Key key, this.text, this.route}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Color(0xFF000000),
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding:
            EdgeInsets.only(bottom: 15.0, top: 15.0, left: 25.0, right: 25.0),
        splashColor: Color(0xFF1F1F1F),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            route,
            (route) => false,
          );
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
