import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/styles.dart';

import 'widgets/category_widget.dart';
import 'active_prescription.dart';
import 'inactive_prescription.dart';
import 'new_prescription.dart';

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
                style: AppTextStyle.displayMedium.copyWith(
                  fontSize: 45,
                )),
          ),
          PrescriptionCategoryWidget(
            titleText: 'New',
            descriptionText: 'View or activate new prescriptions.',
            backgroundColor: AppColors.primary,
            followingScreen: NewPrescriptionScreen(),
          ),
          PrescriptionCategoryWidget(
            titleText: 'Active',
            descriptionText: 'View or deactivate new prescriptions.',
            backgroundColor: AppColors.secondary,
            followingScreen: ActivePrescriptionScreen(),
          ),
          PrescriptionCategoryWidget(
            titleText: 'Inactive',
            descriptionText: 'View or reactivate past prescriptions.',
            backgroundColor: AppColors.alternate,
            followingScreen: InactivePrescriptionScreen(),
          ),
        ],
      ),
    );
  }
}
