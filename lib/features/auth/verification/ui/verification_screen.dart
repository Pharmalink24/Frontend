// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';

const kMarginBetweenTitleAndInputs = 35.0;

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String email = "member@email.com";

  @override
  void initState() {
    sendVerificationRequest();
    super.initState();
  }

  void sendVerificationRequest() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                  "Please verify your email",
                  style: AppTextStyle.displayMedium.copyWith(fontSize: 28.0),
                ),
              ),
              Text(
                "You're almost there! We sent an email to",
                style: AppTextStyle.displayMedium.copyWith(fontSize: 16.0),
              ),
              Text(
                email,
                style: AppTextStyle.displayMedium.copyWith(fontSize: 20.0),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                  "Just click on the link in that email to complete your signup. if you don't see it, you may need to check your spam folder.",
                  style: AppTextStyle.bodyMedium,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text("Still can't find the email? No problem."),
              ),
              FormButton(
                text: "Resend Verification Email",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
