// Flutter Packages
import 'package:flutter/material.dart';
// Screens
import 'package:pharmalink/presentation/screens/signin/signin_screen.dart';
// Components Packages
import 'package:pharmalink/presentation/components/icon_content.dart';
import 'package:pharmalink/presentation/components/reusable_card.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants/app_bar.dart';
import 'package:pharmalink/utilities/constants/colors.dart';
import 'package:pharmalink/utilities/constants/styles.dart';
import 'package:pharmalink/utilities/constants/urls.dart';
// External Packages

const kLogoSize = 175.0;
const kTitleSize = 50.0;
const kSubtitleSize = 18.0;

class LandingScreen extends StatelessWidget {
  static String url = "landing/";
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutLabel,
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
                          context, "${URL.patient}/${SignInScreen.url}");
                    },
                    backgroundColor: AppColors.secondary,
                    borderColor: AppColors.alternate,
                    child: const IconContent(
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
                          context, "${URL.doctor}/${SignInScreen.url}");
                    },
                    backgroundColor: AppColors.alternate,
                    borderColor: AppColors.secondary,
                    child: const IconContent(
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
