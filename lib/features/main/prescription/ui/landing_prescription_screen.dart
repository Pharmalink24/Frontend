import 'package:flutter/material.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import 'widgets/category_widget.dart';

class LandingPrescriptionScreen extends StatelessWidget {
  const LandingPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 16),
            child: Text(
              AppLocalizations.of(context).translate('prescriptions'),
              style: AppTextStyle.displayMedium(context),
            ),
          ),
          PrescriptionCategoryWidget(
            title: AppLocalizations.of(context).translate('newDrugs'),
            description:
                AppLocalizations.of(context).translate('newDrugsDescription'),
            backgroundColor: AppColors.primary,
            category: DrugState.NEW,
          ),
          PrescriptionCategoryWidget(
            title: AppLocalizations.of(context).translate('activeDrugs'),
            description: AppLocalizations.of(context)
                .translate('activeDrugsDescription'),
            backgroundColor: AppColors.secondary,
            category: DrugState.ACTIVE,
          ),
          PrescriptionCategoryWidget(
            title: AppLocalizations.of(context).translate('inactiveDrugs'),
            description: AppLocalizations.of(context)
                .translate('inactiveDrugsDescription'),
            backgroundColor: AppColors.alternate,
            category: DrugState.INACTIVE,
          ),
        ],
      ),
    );
  }
}
