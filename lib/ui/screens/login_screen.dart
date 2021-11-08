import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:medical_app/business_logic/login/provider.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/ui/screens/home_layout.dart';
import 'package:medical_app/ui/screens/sgin_up_screen.dart';
import 'package:medical_app/ui/widgets/btn.dart';
import 'package:medical_app/ui/widgets/form_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mailController = TextEditingController();
    var passController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ChangeNotifierProvider(
                create: (context) => LoginProvider(),
                child: Consumer<LoginProvider>(
                  builder: (context, login, child) => Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 140,
                          height: 100,
                          child: Image.asset(logo),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Welcome",
                          style: TextStyle(
                            color: sColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Asmaa',
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Sgin in to continue",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Asmaa',
                          ),
                        ),
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
                            controller: passController,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value.isEmpty) {
                                return "*Your Password Empty";
                              }
                            },
                            label: 'Password',
                            prefix: FlutterRemix.lock_password_line),
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
                                    login.userLogin(
                                        email: mailController.text,
                                        password: passController.text);

                                    navigatToFinish(context, const HomeLayout());
                                  }
                                })),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          const Text(
                            'Don\'t have an account?',
                          ),
                          TextButton(
                              onPressed: () {
                                navigatTo(context, const RegisterScreen());
                              },
                              child: Text(
                                'register',
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
