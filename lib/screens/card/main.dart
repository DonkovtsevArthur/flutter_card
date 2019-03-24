import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:front_flutter/helpers/cardClass.dart';

@immutable
class CardInfo extends StatelessWidget {
  CardData cardInfo;

  CardInfo(CardData cardInfo) {
    this.cardInfo = cardInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            this.cardInfo.name,
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.dehaze),
              color: Colors.white,
              tooltip: 'more',
              onPressed: () {
                print("more");
              },
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              iconSize: 34.0,
            )
          ],
          elevation: 0,
          backgroundColor: this.cardInfo.getBackgroundColor(),
        ),
        body: Column(
          children: <Widget>[getHead(context)],
        ));
  }

  getHead(BuildContext context) {
    return Container(
      color: this.cardInfo.getBackgroundColor(),
//      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Transform.rotate(
                  angle: 150,
                  child: Icon(
                    Icons.link,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => openWebView()));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        this.cardInfo.link,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              children: <Widget>[
                Container(
                  width: 270,
                  height: 150,
                  foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                          'lib/assets/images/cards/${this.cardInfo.cardImageName}FotoFront.png'),
                    ),
                    // ...
                  ),
                ),
                Container(
                  width: 270,
                  height: 150,
                  foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(
                            'lib/assets/images/cards/${this.cardInfo.cardImageName}FotoFront.png')),
                    // ...
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  openWebView() {
    return WebviewScaffold(
      url: this.cardInfo.link,
      appBar: new AppBar(
        title: Text(this.cardInfo.name),
        backgroundColor: this.cardInfo.getBackgroundColor(),
      ),
//      withZoom: true,
//      withLocalStorage: true,
//      hidden: true,
//      initialChild: Container(
//        color: Colors.redAccent,
//        child: const Center(
//          child: Text('Waiting.....'),
//        ),
//      ),
    );
  }
}
