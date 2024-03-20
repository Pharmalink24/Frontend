// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
// Components Packages
// Utilities Packages
// import 'package:pharmalink/utilities/constants.dart';
// External Packages

class PatientDrugInteractionScreen extends StatefulWidget {
  static String url = "patient/drug_interaction/";

  const PatientDrugInteractionScreen({super.key});

  @override
  State<PatientDrugInteractionScreen> createState() => _PatientDrugInteractionScreenState();
}

class _PatientDrugInteractionScreenState extends State<PatientDrugInteractionScreen> {
  void getCurrentUser() {}

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
