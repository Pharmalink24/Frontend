import 'package:flutter/material.dart';
import 'package:pharmalink/core/widgets/form/form_view.dart';
import 'package:pharmalink/features/signin/models/signin_fields.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/signin/ui/widgets/signin_button.dart';
import 'package:pharmalink/features/signin/ui/widgets/terms_and_conditions_text.dart';
import 'widgets/signin_tab.dart';

const kMarginBetweenTitleAndInputs = 60.0;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                const SizedBox(
                  width: double.infinity,
                  height: kMarginBetweenTitleAndInputs,
                  child: Text(
                    'Welcome to PharmaLink, where you manage your prescriptions !',
                    style: AppTextStyle.labelMedium,
                  ),
                ),
                FormView(model: signInFields),
                const SigninButton(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forget Password?",
                        style: AppTextStyle.labelMedium.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: TermsAndConditionsText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
