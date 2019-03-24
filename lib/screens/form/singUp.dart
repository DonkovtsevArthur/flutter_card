import 'package:flutter/material.dart';
import 'package:front_flutter/helpers/colorConverter.dart';
import './widgets/appBar.dart';
import './widgets/forms.dart';
import './widgets//headers.dart';
import '../../main.dart';

class SingUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SingUpState();
  }
}

class SingUpState extends State<SingUp> {
  dynamic textColor = ColConv('FFC05B7F').gc();
  dynamic blackColor = ColConv('FF453C3C').gc();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        navigationBack();
      },
      child: Scaffold(
        appBar: getAppBar(navigationBack, blackColor),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
          child: ListView(
            children: <Widget>[
              Headers(blackColor, textColor),
              Forms(),
            ],
          ),
        ),
      ),
    );
  }

  void navigationBack() => Navigator.pop(context);
}
