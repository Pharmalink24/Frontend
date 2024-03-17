// Flutter Packages
import 'package:flutter/material.dart';
// Screens
import 'package:pharmalink/screens/patient/signin_screen.dart';
// Components
import 'package:pharmalink/components/flat_text_field.dart';
import 'package:pharmalink/components/rounded_button.dart';
// Data
import 'package:pharmalink/data/signup.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';
// Packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const kMarginBetweenTitleAndInputs = 35.0;

class PatientSignUpScreen extends StatefulWidget {
  static String url = "/patient/signup";

  const PatientSignUpScreen({super.key});

  @override
  State<PatientSignUpScreen> createState() => _PatientSignUpScreenState();
}

class _PatientSignUpScreenState extends State<PatientSignUpScreen> {
  Map<String, dynamic> signUpValues = {};
  bool _saving = false;

  List<FlatTextField> getInputs() {
    List<FlatTextField> inputs = [];
    var textInputType;
    signupInputs.forEach((name, type) {
      if (type == InputType.text) {
        textInputType = TextInputType.name;
      } else if (type == InputType.email) {
        textInputType = TextInputType.emailAddress;
      } else if (type == InputType.password) {
        textInputType = TextInputType.visiblePassword;
      } else {}

      var textField = FlatTextField(
        hintText: name,
        keyboardType: textInputType,
        onChanged: (value) {
          signUpValues[name] = value;
        },
      );
      inputs.add(textField);
    });
    return inputs;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App.barWithoutLabel,
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _saving,
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Hero(
                          tag: "SignInTitle",
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PatientSignInScreen.url);
                            },
                            child: Text(
                              "Sign In",
                              style: AppTextStyle.title.copyWith(
                                color: AppColors.secondaryText,
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
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Sign Up",
                              style: AppTextStyle.title.copyWith(
                                color: AppColors.primaryText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
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
                  const SizedBox(
                    height: kMarginBetweenTitleAndInputs,
                  ),
                  Column(
                    children: getInputs(),
                  ),
                  RoundedButton(
                    text: "Create an account",
                    onPressed: () {
                      setState(() {
                        _saving = true;
                      });
                      try {
                        signUpValues.forEach((key, value) {
                          // print((key, value));
                        });
                      } catch (e) {}
                      setState(() {
                        _saving = false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
