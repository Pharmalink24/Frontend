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
import 'package:pharmalink/data/web_services/networking.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants/apis.dart';
import 'package:pharmalink/utilities/constants/app_bar.dart';
import 'package:pharmalink/utilities/constants/colors.dart';
import 'package:pharmalink/utilities/constants/fonts.dart';
import 'package:pharmalink/utilities/constants/styles.dart';
import 'package:pharmalink/utilities/constants/urls.dart';

const kMarginBetweenTitleAndInputs = 20.0;

class SignInScreen extends StatefulWidget {
  static const String url = "signin/";
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

      Api api = Api();
      var response = await api.post(
        widget.apiUrl,
        body,
        false,
        200,
      );

      if (response != null) {
        Navigator.pushNamed(
          context,
          widget.apiUrl == API.doctorSignUp
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
      appBar: MyAppBar.withoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      body: SafeArea(
        child: ModalProgressHUD(
          blur: 1.0,
          inAsyncCall: _saving,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
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
                          child: Material(
                            type: MaterialType.transparency,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Hero(
                        tag: "SignUpTitle",
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              widget.apiUrl == API.doctorSignIn
                                  ? "${URL.doctor}/${SignUpScreen.url}"
                                  : "${URL.patient}/${SignUpScreen.url}",
                            );
                          },
                          child: Material(
                            type: MaterialType.transparency,
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
                    ),
                  ],
                ),
                const SizedBox(
                  width: double.infinity,
                  height: kMarginBetweenTitleAndInputs,
                  child: Hero(
                    tag: "label",
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        'Let\'s get started by filling out the form below.',
                        style: AppTextStyle.labelMedium,
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
    );
  }
}
