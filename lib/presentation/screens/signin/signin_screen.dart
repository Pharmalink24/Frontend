// Flutter Packages
import 'package:flutter/material.dart';
// External Packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// Models Packages
import 'package:pharmalink/presentation/screens/signin/signin_fields.dart';
// Components Packages
import 'package:pharmalink/presentation/components/form_view.dart';
import 'package:pharmalink/presentation/components/rounded_button.dart';
// Screens Packages
import 'package:pharmalink/presentation/screens/doctor/doctor_main.dart';
import 'package:pharmalink/presentation/screens/patient/patient_main.dart';
import 'package:pharmalink/presentation/screens/signup/signup_screen.dart';
// Services Packages
import 'package:pharmalink/services/networking.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants/constants.dart';

const kMarginBetweenTitleAndInputs = 20.0;

class SignInScreen extends StatefulWidget {
  static String url = "signin/";
  final String apiUrl;
  const SignInScreen({super.key, required this.apiUrl});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _saving = false;

  void signInRequest() async {
    try {
      Map body = {};
      for (var input in signInFields) {
        body[input.dbName] = input.value;
      }

      API api = API();
      var response = await api.post(
        widget.apiUrl,
        body,
        false,
        200,
      );

      if (response != null) {
        Navigator.pushNamed(
          context,
          widget.apiUrl == ApiUrl.doctorSignUp
              ? DoctorScreen.url
              : PatientScreen.url,
        );
      } else {
        throw "Exception";
      }
    } catch (e) {
      print(e);
    }
  }

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
                              child: Text(
                                "Sign In",
                                style: AppTextStyle.displaySmall.copyWith(
                                  fontFamily: AppFonts.tertiary,
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
                                  context,
                                  widget.apiUrl == ApiUrl.doctorSignIn
                                      ? "${AppUrl.doctor}/${SignUpScreen.url}"
                                      : "${AppUrl.patient}/${SignUpScreen.url}",
                                );
                              },
                              child: Text(
                                "Sign Up",
                                style: AppTextStyle.displaySmall.copyWith(
                                  fontFamily: AppFonts.tertiary,
                                  color: AppColors.secondaryText,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Let\'s get started by filling out the form below.',
                          style: AppTextStyle.labelSmall,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kMarginBetweenTitleAndInputs,
                  ),
                  FormView(model: signInFields),
                  RoundedButton(
                    text: "Sign In",
                    onPressed: () async {
                      setState(() {
                        _saving = true;
                      });
                      signInRequest();
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
                        style: AppTextStyle.labelMedium,
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
