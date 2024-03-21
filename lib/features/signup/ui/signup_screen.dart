// ignore_for_file: prefer_const_constructors

// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/widgets/form/form_view.dart';
import 'package:pharmalink/features/signup/models/patient_signup_fields.dart';
// Screens Packages
import 'package:pharmalink/features/signup/ui/verification_screen.dart';
import 'package:pharmalink/core/helpers/classes/field.dart';
import 'package:pharmalink/core/helpers/constants/apis.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/helpers/constants/urls.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/widgets/form/form_button.dart';

const kMarginBetweenTitleAndInputs = 40.0;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

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
                model: patientSignUpFields,
              ),
              FormButton(
                text: "Create an account",
                onPressed: () async {
                  setState(() {
                    _saving = true;
                  });

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
