import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/business_logic/medical/provider.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/ui/screens/edit_profile.dart';
import 'package:medical_app/ui/screens/login_screen.dart';
import 'package:medical_app/ui/screens/my_appointment_screen.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalProvider>(
        builder: (context, model, child) => Column(
              children: [
                userInfoCard(context, model.userModel),
                const SizedBox(
                  height: 15,
                ),
                itemCard(
                  "My Appointment",
                  "assets/images/myappointment.png",
                  () {




                    navigatTo(context, const MyAppointment());
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                itemCard(
                  "contact us",
                  "assets/images/contact.png",
                  () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                itemCard(
                  "LogOut",
                  "assets/images/exit.png",
                      () {

                    model.logOut();

                    navigatToFinish(context, const LoginScreen());


                      },
                ),
              ],
            ));
  }
}

Widget userInfoCard(context, model) {
  return Card(
    elevation: 0.2,
    child: Row(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircleAvatar(
            child: Image.network(
              "https://image.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg",
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          children: [
            Text(
              "${model.name}",
                style: GoogleFonts.alata(
                  textStyle: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: sColor,

                  ),
                )
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Icon(
                  FlutterRemix.user_location_line,
                  size: 12,
                ),
                const SizedBox(
                  width: 2,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "${model.address}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            navigatTo(context, EditProfileScreen());
          },
          child: const Icon(FlutterRemix.edit_2_line),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(sColor),
          ),
        )
      ],
    ),
  );
}

Widget itemCard(text, imgName, onTap) {
  return InkWell(
    onTap: onTap,
    child: Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              text,
                style: GoogleFonts.k2d(
                  textStyle: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: sColor,

                  ),
                )
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Image.asset(
                imgName,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
