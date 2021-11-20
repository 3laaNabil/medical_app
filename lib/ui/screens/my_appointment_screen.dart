import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/business_logic/medical/provider.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/data/model/appointment_model.dart';
import 'package:provider/provider.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalProvider>(
        builder: (context, model, child) => Scaffold(
              backgroundColor: mainColor,
              appBar: AppBar(
                backgroundColor: mainColor,
                elevation: 0,
                iconTheme: IconThemeData(color: sColor),
                title: Text(
                  "My Appointment",
                  style: TextStyle(color: sColor),
                ),
              ),
              body:  model.appointments == null
                  ? Center(
                      child: SizedBox(
                          width: 200,
                          height: 300,
                          child: Column(
                            children: [
                              Image.asset("assets/images/appointment.png"),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "Not Appointment yet",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )))
                  :  ListView.builder(
                      itemBuilder: (context, index) =>
                          appointmentItem(model.appointments[index]),
                      itemCount: model.appointments.length,
                      physics: const BouncingScrollPhysics(),
                    ),
            ));
  }

  Widget appointmentItem(AppointmentModel model) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Dr:",
                      style: GoogleFonts.alata(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${model.docName}",
                      style: GoogleFonts.alata(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: sColor,
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "location:",
                      style: GoogleFonts.alata(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${model.location}",
                      style: GoogleFonts.alata(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: sColor,
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Booking date:",
                      style: GoogleFonts.alata(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${model.dateTime}",
                      style: GoogleFonts.alata(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: sColor,
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
