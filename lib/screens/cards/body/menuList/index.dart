import 'package:flutter/material.dart';
import '../../../../colors.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../../actions.dart';
import '../../../../state.dart';
import 'package:redux/redux.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../main.dart';
import './../../../form/widgets/helpersForm.dart';

Widget menuList(
    BuildContext context, String title, Object icon, func, bool isShow) {
  return StoreConnector<AppState, VoidCallback>(
    converter: (Store<AppState> store) {
      return () {
        store.dispatch(DeleteInfoUsersPhone());
      };
    },
    builder: (BuildContext context, VoidCallback increase) {
      return Padding(
        padding: EdgeInsets.only(top: 24.0, left: 20.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: defaultColors,
            ),
            InkWell(
                onTap: () {
                  func(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.black),
                  ),
                )),
            Container(
              width: 68.0,
            ),
            isShow
                ? FlatButton(
                    child: Text('sign out',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: defaultColors, fontSize: 12.0)),
                    onPressed: () => pressExit(context, increase),
                  )
                : Container()
          ],
        ),
      );
    },
  );
}

void pressExit(context, increase) async {
  final localeStorage = await SharedPreferences.getInstance();
  localeStorage.remove('token');
  localeStorage.remove('userId');
  DeleteInfoUsersPhone();
  navigationMain(context);
  increase();
  print('exit');
}
