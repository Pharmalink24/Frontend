import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
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
            iconData: Icons.add_circle_outline,
            title: AppLocalizations.of(context).translate('newDrugs'),
            description:
                AppLocalizations.of(context).translate('newDrugsDescription'),
            backgroundColor: context.colorScheme.primary,
            category: DrugState.NEW,
          ),
          PrescriptionCategoryWidget(
            iconData: Icons.circle,
            title: AppLocalizations.of(context).translate('activeDrugs'),
            description: AppLocalizations.of(context)
                .translate('activeDrugsDescription'),
            backgroundColor: context.colorScheme.secondary,
            category: DrugState.ACTIVE,
          ),
          PrescriptionCategoryWidget(
            iconData: Icons.stop_circle_outlined,
            title: AppLocalizations.of(context).translate('inactiveDrugs'),
            description: AppLocalizations.of(context)
                .translate('inactiveDrugsDescription'),
            backgroundColor: context.colorScheme.scrim,
            category: DrugState.INACTIVE,
          ),
        ],
      ),
    );
  }
}
