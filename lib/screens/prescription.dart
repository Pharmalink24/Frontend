import 'package:flutter/material.dart';
import 'package:pharmalink/services/networking.dart';
import 'package:pharmalink/utilities/app_theme.dart';
import '../components/doctor_prescription_card.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
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
