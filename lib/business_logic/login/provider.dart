import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  void userLogin({
    required String? email,
    required String? password,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
    }).catchError((error) {
      print(error.toString());
    });
  }
}
