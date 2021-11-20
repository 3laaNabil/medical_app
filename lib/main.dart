import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/ui/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'business_logic/medical/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MedicalProvider()..getUserData()..getAllDoctors()..getAppointment(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,


        home: LoginScreen(),
      ),
    );
  }
}

