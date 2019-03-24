import 'package:flutter/material.dart';
import '../../form/singUp.dart';

void navigationToSignUp(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SingUp()));
}

void aboutAppTap() {
  print("about app");
}
