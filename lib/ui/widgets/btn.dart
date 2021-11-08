import 'package:flutter/material.dart';

import '../../constants.dart';


Widget defaultButton({
  required String text,
  required VoidCallback onTap,
}) {
  return ElevatedButton(

    onPressed: onTap,
    child: Text(text),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(sColor),
    ),
  );
}