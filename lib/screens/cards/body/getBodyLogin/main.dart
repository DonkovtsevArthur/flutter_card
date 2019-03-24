import 'package:flutter/material.dart';
import '../menuList/index.dart';
import '../function.dart';

Widget getBodyLogin(BuildContext context, phone) {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Divider(),
      ),
      menuList(context, phone, Icons.person, navigationToSignUp, true),
      menuList(context, "About app", Icons.error_outline, aboutAppTap, false),
    ],
  );
}
