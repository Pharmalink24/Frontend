import 'package:flutter/material.dart';
import 'package:pharmalink/core/enums/drug_state.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import 'widgets/category_widget.dart';

class LandingPrescriptionScreen extends StatelessWidget {
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
              title: 'New Drugs',
              description: 'View or activate new drugs.',
              backgroundColor: AppColors.primary,
              category: DrugState.NEW,
            ),
            const PrescriptionCategoryWidget(
              title: 'Active Drugs',
              description: 'View or deactivate new drugs.',
              backgroundColor: AppColors.secondary,
              category: DrugState.ACTIVE,
            ),
            const PrescriptionCategoryWidget(
              title: 'Inactive Drugs',
              description: 'View or reactivate past drugs.',
              backgroundColor: AppColors.alternate,
              category: DrugState.INACTIVE,
            ),
          ],
        ),
      ),
    );
  }
}
