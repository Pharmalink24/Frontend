// ignore_for_file: prefer_const_constructors

// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
import 'package:pharmalink/presentation/screens/signup/verification_screen.dart';
// Components Packages
import 'package:pharmalink/presentation/components/rounded_button.dart';
import 'package:pharmalink/presentation/components/form_view.dart';
// Models Packages
import 'package:pharmalink/presentation/classes/field.dart';
// Services Packages
import 'package:pharmalink/data/web_services/networking.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants/constants.dart';
// External Packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const kMarginBetweenTitleAndInputs = 20.0;

class SignUpScreen extends StatefulWidget {
  static String url = "signup/";
  final String apiUrl;
  final List<Field> signUpModel;

  const SignUpScreen(
      {super.key, required this.apiUrl, required this.signUpModel});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _saving = false;

  @override
  void initState() {
    super.initState();
  }

  void signUpRequest() async {
    try {
      Map body = {};
      for (var input in widget.signUpModel) {
        if (input.dbName != null) body[input.dbName] = input.value;
      }

      API api = API();
      var response = await api.post(
        widget.apiUrl,
        body,
        false,
        201,
      );

      print("response $response");
      if (response != null) {
        Navigator.pushNamed(
          context,
          widget.apiUrl == ApiUrl.doctorSignUp
              ? "${AppUrl.doctor}/${VerificationScreen.url}"
              : "${AppUrl.patient}/${VerificationScreen.url}",
        );
      } else {
        throw "Null Response";
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
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Sign In",
                              style: AppTextStyle.headlineLarge.copyWith(
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
                              style: AppTextStyle.headlineLarge.copyWith(
                                color: AppColors.primaryText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
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
                  SizedBox(
                    height: kMarginBetweenTitleAndInputs,
                  ),
                  FormView(
                    model: widget.signUpModel,
                  ),
                  RoundedButton(
                    text: "Create an account",
                    onPressed: () async {
                      setState(() {
                        _saving = true;
                      });
                      signUpRequest();
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
