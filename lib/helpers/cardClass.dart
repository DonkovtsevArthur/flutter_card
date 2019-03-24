import 'package:flutter/material.dart';
import 'package:front_flutter/helpers/colorConverter.dart';

class CardData {
  String key;
  String name;
  String cardImageName;
  String backgroundColor;
  String link;

  CardData(String key, String cardImageName, String backgroundColor,
      String name, String link) {
    this.key = key;
    this.cardImageName = cardImageName;
    this.backgroundColor = backgroundColor;
    this.name = name;
    this.link = link;
  }

  Color getBackgroundColor() {
    return new ColConv(this.backgroundColor).gc();
  }
}
