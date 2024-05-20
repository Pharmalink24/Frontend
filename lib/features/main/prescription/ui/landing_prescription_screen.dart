import 'package:flutter/material.dart';
import '../../../../core/enums/drug_state.dart';
import '../../../../core/localization/app_localizations.dart';
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
            icon: const Icon(Icons.add),
            title: AppLocalizations.of(context).translate('newDrugs'),
            description:
                AppLocalizations.of(context).translate('newDrugsDescription'),
            backgroundColor: Theme.of(context).colorScheme.primary,
            category: DrugState.NEW,
          ),
          PrescriptionCategoryWidget(
            icon: const Icon(Icons.medical_services),
            title: AppLocalizations.of(context).translate('activeDrugs'),
            description: AppLocalizations.of(context)
                .translate('activeDrugsDescription'),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            category: DrugState.ACTIVE,
          ),
          PrescriptionCategoryWidget(
            icon: const Icon(Icons.medical_services),
            title: AppLocalizations.of(context).translate('inactiveDrugs'),
            description: AppLocalizations.of(context)
                .translate('inactiveDrugsDescription'),
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            category: DrugState.INACTIVE,
          ),
        ],
      ),
    );
  }
}
