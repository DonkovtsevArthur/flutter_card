import 'package:flutter/material.dart';

import './appBar/main.dart';
import './body/main.dart';

class CardsDrawer extends StatefulWidget {
  CardsDrawer(GlobalKey<ScaffoldState> cardsScaffoldKey);

  @override
  CardsDrawerState createState() {
    return CardsDrawerState();
  }
}

class CardsDrawerState extends State<CardsDrawer> {
  void signUp() {
    print("sign up");
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        key: Key("cardsDrawer"),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(context, "Settings"),
          body: getBody(context),
        ));
  }
}
