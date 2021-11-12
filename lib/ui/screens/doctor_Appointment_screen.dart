import 'package:flutter/material.dart';
import 'package:medical_app/business_logic/medical/provider.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';


class DoctorAppointmentScreen extends StatelessWidget {

  var docIndex;


  DoctorAppointmentScreen(this.docIndex);

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalProvider>(
        builder: (context, model, child) =>  Scaffold(
backgroundColor: mainColor,
          appBar: AppBar(title: Text("book with Dr/ ${model.doctors[docIndex].name}",style: TextStyle(color: sColor),),

            iconTheme: IconThemeData(color: sColor),
            backgroundColor: mainColor,
            elevation: 0,
          ),


        ));
  }
}
