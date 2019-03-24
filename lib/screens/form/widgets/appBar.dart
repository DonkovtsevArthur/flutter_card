import 'package:flutter/material.dart';

Widget getAppBar(navigationBack, blackColor) {
  return AppBar(
      elevation: 0,
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
      centerTitle: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: blackColor,
          size: 30.0,
        ),
        onPressed: () {
          navigationBack();
        },
      ),
      title: FlatButton(
          onPressed: () {
            navigationBack();
          },
          child: SizedBox.expand(
              child: Align(
            alignment: Alignment(-1.5, 0),
            child: Text(
              'Registration',
              style: TextStyle(
                color: blackColor,
                fontFamily: 'RobotoMedium',
              ),
              textDirection: TextDirection.ltr,
            ),
          ))));
}
