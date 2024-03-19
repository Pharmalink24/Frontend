import 'package:flutter/material.dart';
import 'package:pharmalink/screens/patient/prescription/inactive_prescription.dart';
import 'package:pharmalink/utilities/app_theme.dart';
import 'active_prescription.dart';
import 'new_prescription.dart';
import '../../../components/category_widget.dart';

class PatientLandingPrescriptionScreen extends StatelessWidget {
  static String url = "/landing_prescription";
  const PatientLandingPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 16),
            child: Text('Prescriptions',
                style: AppTheme.displayMedium(
                  fontSize: 45,
                )),
          ),
          PrescriptionCategoryWidget(
            titleText: 'New',
            descriptionText: 'View or activate new prescriptions.',
            backgroundColor: AppTheme.primary,
            followingScreen: NewPrescriptionScreen(),
          ),
          PrescriptionCategoryWidget(
            titleText: 'Active',
            descriptionText: 'View or deactivate new prescriptions.',
            backgroundColor: AppTheme.secondary,
            followingScreen: ActivePrescriptionScreen(),
          ),
          PrescriptionCategoryWidget(
            titleText: 'Inactive',
            descriptionText: 'View or reactivate past prescriptions.',
            backgroundColor: AppTheme.alternate,
            followingScreen: InactivePrescriptionScreen(),
          ),
        ],
      ),
    );
  }
}
