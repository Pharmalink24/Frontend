// ignore_for_file: prefer_const_constructors

// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
import 'package:pharmalink/features/signup/verification_screen.dart';
// Components Packages
import 'package:pharmalink/core/widgets/rounded_button.dart';
import 'package:pharmalink/core/widgets/form_view.dart';
// Models Packages
import 'package:pharmalink/core/helpers/classes/field.dart';
// Utilities Packages
import 'package:pharmalink/core/helpers/constants/apis.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/helpers/constants/urls.dart';
// External Packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const kMarginBetweenTitleAndInputs = 40.0;

class SignUpScreen extends StatefulWidget {
  final String apiUrl;
  final List<Field> signUpFields;

  const SignUpScreen(
      {super.key, required this.apiUrl, required this.signUpFields});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _saving = false;
  late var user;

  @override
  void initState() {
    super.initState();
  }

  void signupRequest() {
    Map body = {};
    for (var field in widget.signUpFields) {
      if (field.dbName != null) body[field.dbName] = field.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _saving,
          child: ListView(
            padding: const EdgeInsets.all(24.0),
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
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            "Sign In",
                            style: AppTextStyle.headlineLarge.copyWith(
                              color: AppColors.secondaryText,
                              fontFamily: AppFonts.tertiary,
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
                          Navigator.pop(context);
                        },
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            "Sign Up",
                            style: AppTextStyle.headlineLarge.copyWith(
                              color: AppColors.primaryText,
                              fontFamily: AppFonts.tertiary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
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
              FormView(
                model: widget.signUpFields,
              ),
              RoundedButton(
                text: "Create an account",
                onPressed: () async {
                  setState(() {
                    _saving = true;
                  });

                  // Sign up process
                  signupRequest();

                  setState(() {
                    _saving = false;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
