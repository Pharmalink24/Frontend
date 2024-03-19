// Flutter Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// Screens Packages
// Components Packages
// Utilities Packages
import 'package:pharmalink/utilities/constants.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
