import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(80.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Image.asset('assets/logo.png', fit: BoxFit.fitWidth,),
            ),
          ],
        ),
      ),
    );
  }
}
