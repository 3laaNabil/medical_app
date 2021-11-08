import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/data/model/user_model.dart';

class SginUpProvider extends ChangeNotifier {
  void userRegister({
    required String? name,
    required String? email,
    required String? password,
    required String? phone,
  }) {
    print('hello');

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      userCreate(
        uId: value.user!.uid,
        phone: phone!,
        email: email,
        name: name!,
      );
    }).catchError((error) {
      print(error.toString());
    });

    notifyListeners();
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      address: 'write you address ...',
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {})
        .catchError((error) {
      print(error.toString());
    });

    notifyListeners();
  }
}
