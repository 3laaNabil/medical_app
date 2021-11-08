

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

String logo = "assets/images/logo.png";

var mainColor = HexColor("#ECF1FA");
var sColor = HexColor("#2A2AC0");
navigatTo(context, widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

navigatToFinish(context, widget) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (route) {
      return false;
    },
  );



}