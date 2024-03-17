// ignore_for_file: prefer_const_constructors

// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
// Components Packages
import 'package:pharmalink/components/rounded_button.dart';
import 'package:pharmalink/components/form_view.dart';
// Models Packages
import 'package:pharmalink/models/input.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants.dart';
// External Packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const kMarginBetweenTitleAndInputs = 35.0;

class SignUpScreen extends StatefulWidget {
  static String url = "/signup";
  final String apiUrl;
  List<Input> signUpModel;

  SignUpScreen({super.key, required this.apiUrl, required this.signUpModel});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _saving = false;

  @override
  void initState() {
    super.initState();
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
                  SizedBox(
                    height: kMarginBetweenTitleAndInputs,
                  ),
                  FormView(
                    model: widget.signUpModel,
                  ),
                  RoundedButton(
                    text: "Create an account",
                    onPressed: () {
                      setState(() {
                        _saving = true;
                      });
                      try {
                        print(widget.signUpModel);
                        // for (var field in patientSignUpModel) {
                        //   var name = field.name;
                        //   var value = field.value;
                        // }
                      } catch (e) {
                        print(e);
                      }
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
