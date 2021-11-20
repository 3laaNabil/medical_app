import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/data/model/appointment_model.dart';
import 'package:medical_app/data/model/banner_model.dart';
import 'package:medical_app/data/model/doctors_model.dart';
import 'package:medical_app/data/model/user_model.dart';
import 'package:medical_app/ui/screens/booking_screen.dart';
import 'package:medical_app/ui/screens/home_screen.dart';
import 'package:medical_app/ui/screens/search_screen.dart';
import 'package:medical_app/ui/screens/settings_screen.dart';

class MedicalProvider extends ChangeNotifier {
  UserModel? userModel;
  DoctorsModel? doctorsModel;
  BannerModel? bannerModel;
  AppointmentModel? appointmentModel;
  final FirebaseAuth auth = FirebaseAuth.instance;

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const BookingScreen(),
    const SearchScreen(),
    const SettingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void getUserData() {
    final User? user = auth.currentUser;
    final uId = user!.uid;
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      notifyListeners();
      // userId=userModel!.uId as User?;
    }).catchError((error) {
      print(error.toString());
      notifyListeners();
    });
  }

  logOut() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  List<DoctorsModel> doctors = [];
  getAllDoctors() async {
    FirebaseFirestore.instance
        .collection('doctors')
        .get()
        .then((QuerySnapshot querySnapshot) {
      doctors = [];
      for (var element in querySnapshot.docs) {
        doctors
            .add(DoctorsModel.fromJson(element.data() as Map<String, dynamic>));
        print(element.data());
      }
    });

    notifyListeners();
  }

  booking({
    @required String? docName,
    @required String? location,
    @required String? dateTime,
  }) async {
    AppointmentModel model =
        AppointmentModel(docName, userModel!.uId, location, dateTime);

    await FirebaseFirestore.instance
        .collection('Appointment')
        .add(model.toMap())
        .then((value) {
      print("Appointment done");
    }).catchError((error) {
      print(error.toString());
    });

    notifyListeners();
  }

  List<AppointmentModel> appointments = [];
  Future<void> getAppointment() async {


    await FirebaseFirestore.instance
        .collection('Appointment')
        .get()
        .then((value) {
      for (var element in value.docs) {
        print(value.toString());
        appointments.add(AppointmentModel.fromJson(element.data()));
        notifyListeners();
      }
    }).catchError((error) {
      print(error.toString());
      notifyListeners();
    });

    notifyListeners();
  }


}
