import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../store/methods.dart';
import '../../../../store/constats.dart';

Future getLocal(String phone) async {
  if (phone != null) {
    final localeStorage = await SharedPreferences.getInstance();
    final String token = localeStorage.getString('token');

    if (token != null) {
      try {
        Map<String, Object> options = {
          'url': userInfo,
          'body': {},
          'methods': 'GET'
        };

        final res2 = actions(options, token);
        return res2;
      } catch (e) {}
    }
  }
}
