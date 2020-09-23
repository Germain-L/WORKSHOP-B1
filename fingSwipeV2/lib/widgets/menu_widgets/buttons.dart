import 'package:flutter/material.dart';

class MenuButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'leaderboard');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(),
              color: Colors.black,
            ),
            child: Center(
              child: Text("Leaderboard", style: TextStyle(fontSize: 30, color: Color(0xffEEEEEE)),),
            ),
          ),
        ),
      ],
    );
  }
}
