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
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            margin: const EdgeInsets.only(bottom: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage("assets/button.png"),
                fit: BoxFit.cover,
              ),
              // border: Border.all(width: 3, color: Color(0xff6ec2bb)),
              // color: Color(0xff6ec2bb),
            ),
            child: Center(
              child: Text("Leaderboard", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xffEEEEEEE)),),
            ),
          ),
        ),
      ],
    );
  }
}
