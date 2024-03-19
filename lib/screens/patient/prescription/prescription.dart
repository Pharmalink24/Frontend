import 'package:flutter/material.dart';
import 'package:pharmalink/utilities/app_theme.dart';

class PatientPrescriptionScreen extends StatefulWidget {
  static String url = "patient/prescription/";

  const PatientPrescriptionScreen({super.key});

  @override
  State<PatientPrescriptionScreen> createState() =>
      _PatientPrescriptionScreenState();
}

class _PatientPrescriptionScreenState extends State<PatientPrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppTheme.secondaryText),
        backgroundColor: AppTheme.primaryBackground,
        title: Text(
          'Prescription',
          style: AppTheme.displayMedium(
            fontSize: 28,
          ),
        ),
        elevation: 2,
      ),
      body: Container(),
    );
  }
}
