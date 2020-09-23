import 'package:fingSwipeV2/providers/game_provider.dart';
import 'package:fingSwipeV2/widgets/core_widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';


class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'normalGame');
        },
        child: Center(
          child: Transform.scale(
            scale: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(LineIcons.play),
                SizedBox(height: 5),
                Text("PLAY", style: TextStyle(fontWeight: FontWeight.w700),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
