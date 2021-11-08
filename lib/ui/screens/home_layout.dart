import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:medical_app/business_logic/medical/provider.dart';

import 'package:medical_app/constants.dart';
import 'package:medical_app/ui/screens/my_appointment_screen.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalProvider>(
        builder: (context, model, child) => Scaffold(
              backgroundColor: mainColor,
              body: SafeArea(child: model.screens[model.currentIndex]),
              bottomNavigationBar: DotNavigationBar(
                currentIndex: model.currentIndex,
                onTap: (index) => model.changeBottom(index),
                // dotIndicatorColor: Colors.black,
                items: [
                  DotNavigationBarItem(
                      icon: const Icon(Icons.home), selectedColor: sColor),
                  DotNavigationBarItem(
                      icon: const Icon(FlutterRemix.calendar_2_line),
                      selectedColor: sColor),
                  DotNavigationBarItem(
                      icon: const Icon(FlutterRemix.search_line),
                      selectedColor: sColor),
                  DotNavigationBarItem(
                      icon: const Icon(FlutterRemix.list_settings_line),
                      selectedColor: sColor),
                ],
              ),
            ));
  }
}
