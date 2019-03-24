import 'package:flutter/material.dart';

class Headers extends StatelessWidget {
  final blackColor;
  final textColor;
  Headers(this.blackColor, this.textColor);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        getText('Hi, friend!'),
        getCenterText("Let's", " create ", "your account."),
        getText('It will be easy)'),
      ],
    );
  }

  Widget getText(String text) {
    return Center(
        child: Text(text,
            style: TextStyle(
                color: blackColor,
                fontSize: 24.0,
                fontFamily: 'RobotoMedium')));
  }

  Widget getCenterText(String leftText, String colorText, String rightText) {
    return Center(
        child: RichText(
            text: TextSpan(
                text: leftText,
                style: TextStyle(
                    color: blackColor,
                    fontSize: 24.0,
                    fontFamily: 'RobotoMedium'),
                children: <TextSpan>[
          TextSpan(
              text: colorText,
              style: TextStyle(
                  color: textColor,
                  fontSize: 24.0,
                  fontFamily: 'RobotoMedium')),
          TextSpan(
              text: rightText,
              style: TextStyle(
                  color: blackColor,
                  fontSize: 24.0,
                  fontFamily: 'RobotoMedium')),
        ])));
  }
}
