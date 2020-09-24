import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/core_widgets/appbar.dart';
import '../widgets/menu_widgets/buttons.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Stack(children: <Widget>[
      Image.asset(
        "assets/background.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(),
        body: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'normalGame');
          },
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/play.svg',
                      height: 75,
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "PLAY",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 30,
                            color: Color(0xff6ec2bb)),
                      ),
                    ),
                  ],
                ),
              ),
              Align(alignment: Alignment.bottomCenter, child: MenuButtons()),
            ],
          ),
        ),
      )
    ]);
  }
}
