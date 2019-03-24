import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../store/constats.dart';
import './button.dart';

import './helpersForm.dart';

class Forms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ISFormState();
  }
}

class ISFormState extends State<Forms> {
  var _formKey = GlobalKey<FormState>();

  bool isIcons = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  var phoneController = new MaskedTextController(mask: '0 000 000 00 00');

  @override
  Widget build(BuildContext context) {
    var inputDecorationTheme = Theme.of(context).inputDecorationTheme;

    return Container(
      child: Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.only(top: 10.0, left: 4.0, right: 4.0, bottom: 33.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please, write your name';
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    labelText: 'Your name',
                    labelStyle: inputDecorationTheme.labelStyle,
                    enabledBorder: inputDecorationTheme.enabledBorder,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please, write your phone';
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    labelText: 'Phone number',
                    labelStyle: inputDecorationTheme.labelStyle,
                    enabledBorder: inputDecorationTheme.enabledBorder,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: isIcons,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please, write your password';
                    }
                    if (value.isNotEmpty && confirmController.text.isEmpty) {
                      return 'Please, write your password';
                    }
                    if (passwordController.text != confirmController.text) {
                      return 'Password != confirm password';
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          isIcons ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          isIcons = !isIcons;
                        });
                      },
                    ),
                    contentPadding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    labelText: 'Password',
                    labelStyle: inputDecorationTheme.labelStyle,
                    enabledBorder: inputDecorationTheme.enabledBorder,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: TextFormField(
                  controller: confirmController,
                  obscureText: true,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please, write your confirm password';
                    }
                    if (value.isNotEmpty && passwordController.text.isEmpty) {
                      return 'Please, write your password';
                    }
                    if (passwordController.text != confirmController.text) {
                      return 'Password != confirm password';
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    labelText: 'Confirm password',
                    labelStyle: inputDecorationTheme.labelStyle,
                    enabledBorder: inputDecorationTheme.enabledBorder,
                  ),
                ),
              ),
              ButtonsItems(pressSign, _formKey),
            ],
          ),
        ),
      ),
    );
  }

  void pressSign(bool isSign) {
    getPost(isSign);
  }

  void getPost(bool isSignUp) async {
    final localeStorage = await SharedPreferences.getInstance();

    var phone = phoneController.text;
    var password = confirmController.text;
    var getTokenLocale = localeStorage.getString('token');

    // var getUserIdLocale = localeStorage.getString('userId');

    getNormalPhone(String text) {
      String t = '';
      text.split(" ").forEach((el) => t += el);
      return t;
    }

    Map<String, String> body = {
      'phone': getNormalPhone(phone),
      'password': password
    };

    isSignUp
        ? getSign(signUp, body, localeStorage, 'User exists', context)
        : getSign(
            signIn, body, localeStorage, 'Wrong login or password', context);
  }
}
