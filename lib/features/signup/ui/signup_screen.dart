// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/widgets/form/form_view.dart';
import 'package:pharmalink/features/signin/ui/widgets/signin_tab.dart';
import 'package:pharmalink/features/signup/models/patient_signup_fields.dart';
// Screens Packages
import 'package:pharmalink/features/signup/ui/verification_screen.dart';
import 'package:pharmalink/core/helpers/classes/field.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pharmalink/features/signup/ui/widgets/signup_tab.dart';

import '../../../core/widgets/form/form_button.dart';

const kMarginBetweenTitleAndInputs = 60.0;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 22.0),
          children: [
            const SignupTab(),
            const SizedBox(
              width: double.infinity,
              height: kMarginBetweenTitleAndInputs,
              child: Text(
                'Welcome to PharmaLink, where you manage your prescriptions !',
                style: AppTextStyle.labelMedium,
                textAlign: TextAlign.start,
              ),
            ),
            FormView(
              model: patientSignUpFields,
            ),
            FormButton(
              text: "Create an account",
              onPressed: () async {},
            )
          ],
        ),
      ),
    );
  }
}
