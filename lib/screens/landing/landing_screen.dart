// Flutter Packages
import 'package:flutter/material.dart';
// Screens
import 'package:pharmalink/screens/signin_screen.dart';
// import 'package:pharmalink/screens/doctor/signin_screen.dart';
// Components
import 'package:pharmalink/components/icon_content.dart';
import 'package:pharmalink/components/reusable_card.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';
// Packages
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const kLogoSize = 175.0;
const kTitleSize = 50.0;
const kSubtitleSize = 18.0;

class LandingScreen extends StatelessWidget {
  static String url = "landing/";
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App.barWithoutLabel,
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Who Are You ?",
                    style: AppTextStyle.bodyMedium.copyWith(
                      fontSize: 35.0,
                    ),
                  ),
                  ReusableCard(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, "${AppUrl.patientUrl}/${SignInScreen.url}");
                    },
                    backgroundColor: AppColors.secondary,
                    borderColor: AppColors.alternate,
                    child: IconContent(
                      icon: Icons.personal_injury_outlined,
                      label: "PATIENT",
                      iconColor: AppColors.alternateText,
                      labelColor: AppColors.alternateText,
                    ),
                  ),
                  const Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  ReusableCard(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, "${AppUrl.doctorUrl}/${SignInScreen.url}");
                    },
                    backgroundColor: AppColors.alternate,
                    borderColor: AppColors.secondary,
                    child: IconContent(
                      icon: Icons.medical_information_outlined,
                      label: "DOCTOR",
                      iconColor: AppColors.primaryText,
                      labelColor: AppColors.primaryText,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
