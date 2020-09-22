import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title = "FingSwipe!";

  CustomAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(70.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Image.asset('assets/logo.png', fit: BoxFit.fitWidth,),
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
