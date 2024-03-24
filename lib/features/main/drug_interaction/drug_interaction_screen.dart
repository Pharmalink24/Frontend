// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
// Components Packages
// Utilities Packages
// import 'package:pharmalink/utilities/constants.dart';
// External Packages

class DrugInteractionScreen extends StatefulWidget {
  static String url = "patient/drug_interaction/";

  const DrugInteractionScreen({super.key});

  @override
  State<DrugInteractionScreen> createState() => _DrugInteractionScreenState();
}

class _DrugInteractionScreenState extends State<DrugInteractionScreen> {
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
