// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
// Components Packages
// Utilities Packages
import 'package:pharmalink/utilities/constants.dart';
// External Packages

class PatientHomeScreen extends StatefulWidget {
  static String url = "patient/home/";

  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  void getCurrentUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App.barWithoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Text("Home Screen"),
      ),
    );
  }
}
