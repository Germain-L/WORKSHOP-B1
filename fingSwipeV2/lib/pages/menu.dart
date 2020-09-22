import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<Nav>(context);
    return InkWell(
      onTap: () {
        nav.changePage(1);
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
    );
  }
}
