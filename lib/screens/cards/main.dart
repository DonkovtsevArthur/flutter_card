import 'package:flutter/material.dart';
import 'package:front_flutter/helpers/cardClass.dart';
import 'package:front_flutter/helpers/colorConverter.dart';
import 'package:front_flutter/screens/cards/card.dart';
import 'package:front_flutter/screens/cards/drawer.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final cardsScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<CardData> cardsData = [
      CardData('pyaterochka', 'pyaterochka', 'FFE4110A', 'Пятерочка', '5ka.ru'),
      CardData('lukoil', 'lukoil', 'FFDE0029', 'Лукоил', 'google.com'),
      CardData('ostin', 'ostin', 'FF000000', "O'STIN", 'google.com'),
      CardData(
          'burgerKing', 'burgerKing', 'FFEC7801', 'Burger King', 'google.com')
    ];

    return Scaffold(
      key: cardsScaffoldKey,
      appBar: _getAppBar("Your Wallet", openDrawer),
      body: _getBody(cardsData),
      backgroundColor: Colors.white,
      endDrawer: CardsDrawer(cardsScaffoldKey),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 32.0,
          ),
          backgroundColor: ColConv("FFC05B7F").gc(),
          onPressed: () {
            print("add card button");
          }),
    );
  }

  void openDrawer() {
    cardsScaffoldKey.currentState.openEndDrawer();
  }

  Widget _getBody(cardsData) {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 9, 18, 0),
      child: ListView.builder(
          // padding: EdgeInsets.only(top: 80.0),
          itemCount: cardsData.length,
          itemExtent: 150.0,
          itemBuilder: (context, i) {
            return MainCard(cardsData[i]);
          }),
    );
  }
}

Widget _getAppBar(String text, openDrawer) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: false,
    title: Text(
      text,
      textDirection: TextDirection.ltr,
      style: TextStyle(color: Colors.black),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.dehaze),
        color: Colors.black,
        tooltip: 'more',
        onPressed: () {
          openDrawer();
        },
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        iconSize: 34.0,
      )
    ],
    elevation: 0,
    backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
  );
}
