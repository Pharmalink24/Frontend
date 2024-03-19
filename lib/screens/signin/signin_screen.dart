// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
import 'package:pharmalink/screens/patient/main.dart';
import 'package:pharmalink/screens/signup/signup_screen.dart';
// Models Packages
import 'package:pharmalink/models/auth/signin.dart';
// Components Packages
import 'package:pharmalink/components/form_view.dart';
import 'package:pharmalink/components/rounded_button.dart';
// Services Packages
import 'package:pharmalink/services/networking.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants.dart';
// External Packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const kMarginBetweenTitleAndInputs = 20.0;

class SignInScreen extends StatefulWidget {
  static String url = "signin/";
  final String apiUrl;
  SignInScreen({super.key, required this.apiUrl});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _saving = false;

  void signInRequest() async {
    try {
      Map body = {};
      for (var input in signInModel) {
        body[input.dbName] = input.value;
      }

      API api = API();
      var response = await api.POST(
        widget.apiUrl,
        body,
        false,
        200,
      );

      if (response != null) {
        Navigator.pushNamed(context, PatientScreen.url);
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
                                      ? "${AppUrl.doctorUrl}/${SignUpScreen.url}"
                                      : "${AppUrl.patientUrl}/${SignUpScreen.url}",
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
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      child: const Padding(
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
                  FormView(model: signInModel),
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