import 'package:flutter/material.dart';
import '../menuList/index.dart';
import '../function.dart';

Widget getBodyNormal(BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Divider(),
      ),
      menuList(context, "Sing up", Icons.person, navigationToSignUp, false),
      menuList(context, "About app", Icons.error_outline, aboutAppTap, false),
    ],
  );
}
