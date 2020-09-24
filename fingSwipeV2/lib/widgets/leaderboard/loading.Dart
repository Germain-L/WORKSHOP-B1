import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff6FC3BC)),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Loading scores ...",
            style: TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}
