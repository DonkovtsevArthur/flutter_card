import 'package:flutter/material.dart';
import 'package:front_flutter/helpers/colorConverter.dart';

Widget appBar(BuildContext context, String text) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0.0,
    backgroundColor: Colors.white,
    centerTitle: false,
    title: Text(
      text,
      style: TextStyle(color: Colors.black),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        color: ColConv("FF000000").gc(),
        onPressed: () {
          Navigator.pop(context);
          print("close drawer");
        },
      ),
    ],
  );
}
