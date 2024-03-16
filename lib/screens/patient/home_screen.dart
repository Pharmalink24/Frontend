// Flutter Packages
import 'package:flutter/material.dart';
// Screens
import 'package:pharmalink/screens/patient/signin_screen.dart';
// Components
import 'package:pharmalink/components/flat_text_field.dart';
import 'package:pharmalink/components/rounded_button.dart';
// Data
import 'package:pharmalink/data/signup.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';
// Packages

const kMarginBetweenTitleAndInputs = 35.0;

class PatientHomeScreen extends StatelessWidget {
  static String url = "/patient/home";
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App.barWithoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Text(""),
      ),
    );
  }
}
