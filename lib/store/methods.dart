import 'dart:async';
// import 'dart:convert';

import 'package:dio/dio.dart';

Future<void> actions(option, token) async {
  String url = option['url'];
  Object body = option['body'];
  String methods = option['methods'].toUpperCase();

  try {
    Dio dio = new Dio();
    Response<dynamic> response;
    response = await dio.request(url,
        data: body,
        options: new Options(
          method: methods,
          headers: {
            "Authorization": 'Bearer $token',
            "Content-Type": "application/json"
          },
        ));
    print('response ${response.data.toString()}');

    return response.data;
  } catch (e) {
    print('error ${e.message}');
  }
}
