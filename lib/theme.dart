import 'package:flutter/material.dart';

import './colors.dart';

ThemeData getTheme() {
  return ThemeData(
    fontFamily: 'RobotoRegular',
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: text16(labelColor),
      enabledBorder: new UnderlineInputBorder(
          borderSide: new BorderSide(color: borderColor)),
    ),
    textTheme: TextTheme(
      button: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
      ),
      body1: text16(labelColor),
    ),
  );
}

Object text16(Object color) {
  return TextStyle(fontSize: 16.0, color: color);
}
