import 'package:flutter/material.dart';
import 'package:pharmalink/core/widgets/form/form_view.dart';
import 'package:pharmalink/features/signin/data/models/signin_fields.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/signin/ui/widgets/signin_button.dart';
import 'package:pharmalink/features/signin/ui/widgets/terms_and_conditions_text.dart';
import 'widgets/forget_password_text.dart';
import 'widgets/signin_tab.dart';
import 'widgets/welcome_text.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 22.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SigninTab(),
                const WelcomeText(),
                FormView(model: signInFields),
                const ForgetPasswordText(),
                const SigninButton(),
                const TermsAndConditionsText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
