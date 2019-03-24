import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../state.dart';

import './getBodyLogin/main.dart';
import './getBodyNormal/index.dart';

Widget getBody(BuildContext context) {
  return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel info) {
        final String phone = info.phone;
        return phone.length > 0
            ? getBodyLogin(context, info.phone)
            : getBodyNormal(context);
      });
}

class _ViewModel {
  final String phone;

  _ViewModel({
    @required this.phone,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(phone: store.state.phone);
  }
}
