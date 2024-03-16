// Flutter Packages
import 'package:flutter/material.dart';
// Screens
import 'package:pharmalink/screens/patient/signin_screen.dart';
// Components
import 'package:pharmalink/components/icon_content.dart';
import 'package:pharmalink/components/reusable_card.dart';
import 'package:pharmalink/components/flat_text_field.dart';
import 'package:pharmalink/components/rounded_button.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';
// Packages
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const kMarginBetweenTitleAndInputs = 35.0;

class PatientSignUpScreen extends StatelessWidget {
  static String url = "/patient/signup";
  const PatientSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App.barWithoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, PatientSignInScreen.url);
                        },
                        child: Text(
                          "Sign In",
                          style: AppTextStyle.title.copyWith(
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
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
                FlatTextField(
                  hintText: "Email",
                ),
                FlatTextField(
                  hintText: "Password",
                ),
                const RoundedButton(
                  text: "Create an account",
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
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
    );
  }
}
