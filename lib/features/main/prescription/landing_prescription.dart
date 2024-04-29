import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import 'all_prescription.dart';
import 'widgets/category_widget.dart';

class LandingPrescriptionScreen extends StatelessWidget {
  static String url = "/landing_prescription";
  const LandingPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 16),
              child: Text('Prescriptions',
                  style: AppTextStyle.displayMedium.copyWith(
                    fontSize: 45,
                  )),
            ),
            const PrescriptionCategoryWidget(
              titleText: 'New',
              descriptionText: 'View or activate new prescriptions.',
              backgroundColor: AppColors.primary,
              followingScreen: AllPrescriptionScreen(category: 'new'),
            ),
            const PrescriptionCategoryWidget(
              titleText: 'Active',
              descriptionText: 'View or deactivate new prescriptions.',
              backgroundColor: AppColors.secondary,
              followingScreen: AllPrescriptionScreen(category: 'active'),
            ),
            const PrescriptionCategoryWidget(
              titleText: 'Inactive',
              descriptionText: 'View or reactivate past prescriptions.',
              backgroundColor: AppColors.alternate,
              followingScreen: AllPrescriptionScreen(category: 'inactive'),
            ),
          ],
        ),
      ),
    );
  }
}
