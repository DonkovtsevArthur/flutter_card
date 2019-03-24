import 'package:flutter/material.dart';
import 'package:front_flutter/helpers/cardClass.dart';
import 'package:front_flutter/screens/card/main.dart';

class MainCard extends StatefulWidget {
  final cardData;

  MainCard(CardData cardData) : cardData = cardData {
    cardData = cardData;
  }

  @override
  MainCardState createState() {
    return new MainCardState();
  }
}

class MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
//    print(this.cardData.getBackgroundColor().toString());
    return Card(
        key: Key(this.widget.cardData.key),
        color: this.widget.cardData.getBackgroundColor(),
        elevation: 4,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardInfo(this.widget.cardData)));
          },
          child: Padding(
              padding: EdgeInsets.all(30.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'lib/assets/images/cards/${this.widget.cardData.cardImageName}.png')),
                  // ...
                ),
              )),
        ));
  }
}
