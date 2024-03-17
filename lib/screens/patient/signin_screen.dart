// Flutter Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// Screens
import 'package:pharmalink/screens/patient/signup_screen.dart';
import 'package:pharmalink/screens/patient/home_screen.dart';
// Components
import 'package:pharmalink/components/rounded_text_field.dart';
import 'package:pharmalink/components/rounded_button.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';
// Services
import 'package:pharmalink/services/networking.dart';
// Packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const kMarginBetweenTitleAndInputs = 35.0;

class PatientSignInScreen extends StatefulWidget {
  static String url = "/patient/signin";
  const PatientSignInScreen({super.key});

  @override
  State<PatientSignInScreen> createState() => _PatientSignInScreenState();
}

class _PatientSignInScreenState extends State<PatientSignInScreen> {
  String email = "";
  String password = "";
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App.barWithoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      body: SafeArea(
        child: ModalProgressHUD(
          blur: 1.0,
          inAsyncCall: _saving,
          child: Flexible(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Hero(
                            tag: "SignInTitle",
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Sign In",
                                style: AppTextStyle.title.copyWith(
                                  color: AppColors.primaryText,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Hero(
                            tag: "SignUpTitle",
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PatientSignUpScreen.url);
                              },
                              child: Text(
                                "Sign Up",
                                style: AppTextStyle.title.copyWith(
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Let\'s get started by filling out the form below.',
                          style: AppTextStyle.subtitle,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kMarginBetweenTitleAndInputs,
                  ),
                  Column(
                    children: [
                      RoundedTextField(
                        hintText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      RoundedTextField(
                        hintText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                      ),
                    ],
                  ),
                  RoundedButton(
                    text: "Sign In",
                    onPressed: () async {
                      setState(() {
                        _saving = true;
                      });
                      try {
                        API api = API();
                        var response = await api.POST(
                          "user/login/",
                          {
                            'email': email,
                            'password': password,
                          },
                          false,
                        );
                        if (response != null) {
                          Navigator.pushNamed(context, PatientHomeScreen.url);
                        } else {
                          throw "Exception";
                        }
                      } catch (e) {
                        print(e);
                      }
                      setState(() {
                        _saving = false;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forget Password",
                        style: AppTextStyle.subtitle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
