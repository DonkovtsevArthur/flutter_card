import 'package:flutter/material.dart';
import '../../../main.dart';
import 'package:flutter/animation.dart';
import '../../../store/methods.dart';

/*
* getSing RUN
*/
void getSign(where, body, localeStorage, errorText, context) {
  var getUserId;
  getUserId = actions(getOptions(where, body), '');
  getUserId.then((token) => {
        token != null
            ? {localeStorage.setString('token', token), navigationMain(context)}
            : {openErrorBar(errorText, context), print('Error signUp $token')}
      });
}

Map<String, Object> getOptions(String url, body) {
  return {'url': url, 'body': body, 'methods': 'POST'};
}

/*
* getSing END
*/
void openErrorBar(error, context) {
  if (error != null) {
    final snackBar =
        SnackBar(backgroundColor: Colors.black87, content: getError(error));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

Widget getError(String error) => Text(error,
    textAlign: TextAlign.center, style: TextStyle(color: Colors.redAccent));

void navigationMain(context) {
  Navigator.push(
    context,
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, _, __) => Main(),
      transitionsBuilder:
          (___, Animation<double> animation, ____, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          ),
        );
      },
    ),
  );
}
