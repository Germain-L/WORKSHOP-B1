import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class LanguageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: SvgPicture.asset('assets/logo.svg'),
    );
  }
}