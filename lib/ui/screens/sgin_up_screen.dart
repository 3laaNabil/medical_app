import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:medical_app/business_logic/sgin_up/provider.dart';
import 'package:medical_app/ui/screens/login_screen.dart';
import 'package:medical_app/ui/widgets/btn.dart';
import 'package:medical_app/ui/widgets/form_field.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: ChangeNotifierProvider(
                create: (context) => SginUpProvider(),
                child: Consumer<SginUpProvider>(
                  builder: (context, sginUp, child) => Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 140,
                          height: 100,
                          child: Image.asset(logo),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            controller: nameController,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value.isEmpty) {
                                return "*Your Name Empty";
                              }
                            },
                            label: 'User Name',
                            prefix: FlutterRemix.emotion_line),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            controller: mailController,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value.isEmpty) {
                                return "*Your Email Empty";
                              }
                            },
                            label: 'Email',
                            prefix: FlutterRemix.mail_line),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            controller: phoneController,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value.isEmpty) {
                                return "*Your Phone Empty";
                              }
                            },
                            label: 'Phone Number',
                            prefix: FlutterRemix.phone_line),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            controller: passController,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value.isEmpty) {
                                return "*Your Password Empty";
                              }
                            },
                            label: 'Password',
                            isPassword: true,
                            prefix: FlutterRemix.passport_line),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 43,
                            child: defaultButton(
                                text: "LOGIN",
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    sginUp.userRegister(
                                        name: nameController.text,
                                        email: mailController.text,
                                        password: passController.text,
                                        phone: phoneController.text);
                                  }
                                })),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'You have an account?',
                              ),
                              TextButton(
                                  onPressed: () {
                                    navigatTo(context, const LoginScreen());
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: sColor),
                                  ))
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
