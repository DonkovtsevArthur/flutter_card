import 'package:flutter/material.dart';
import 'package:front_flutter/helpers/colorConverter.dart';

class ButtonsItems extends StatelessWidget {
  ButtonsItems(this.pressSign, this._formKey);

  final pressSign;
  final _formKey;

  @override
  Widget build(BuildContext context) {
    TextStyle textButton = Theme.of(context).textTheme.button;

    dynamic blackColor = ColConv('FF453C3C').gc();
    dynamic gradientStart = ColConv('FFC05B7F').gc();
    dynamic gradientEnd = ColConv('FFA05BC0').gc();

    return Column(children: <Widget>[
      Container(
        height: 48.0,
        margin: EdgeInsets.only(top: 40.0),
        child: buttonItem(
            'Sign in', TextStyle(color: blackColor), pressSign, context),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Container(
          alignment: FractionalOffset.bottomCenter,
          height: 48.0,
          child: buttonItem(
              'sign up'.toUpperCase(), textButton, pressSign, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 0.0),
                colors: [gradientStart, gradientEnd]),
          ),
        ),
      )
    ]);
  }

  Widget buttonItem(text, textButton, pressSign, context) {
    return MaterialButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          bool isSign = text.toLowerCase() == 'sign up';
          pressSign(isSign);
        }
      },
      child: SizedBox.expand(
          child: Center(
        child: Text(
          text,
          style: textButton,
        ),
      )),
    );
  }
}
