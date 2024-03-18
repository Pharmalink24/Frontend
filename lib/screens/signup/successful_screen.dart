// ignore_for_file: prefer_const_constructors

// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
import 'package:pharmalink/screens/signup/successful_screen.dart';
// Components Packages
import 'package:pharmalink/components/form_view.dart';
import 'package:pharmalink/components/rounded_button.dart';
// Models Packages
import 'package:pharmalink/models/input.dart';
// Services Packages
import 'package:pharmalink/services/networking.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants.dart';
// External Packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const kMarginBetweenTitleAndInputs = 35.0;

class SuccessfulScreen extends StatefulWidget {
  static String url = "/signup/successful";

  const SuccessfulScreen({super.key});

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App.barWithoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
