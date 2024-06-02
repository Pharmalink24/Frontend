import 'package:flutter/material.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import '../../../../../../core/theme/styles.dart';
import '../../../../../../core/widgets/expansion_card_container.dart';

class DiagnosisCard extends StatelessWidget {
  final String diagnosis;

  const DiagnosisCard({
    super.key,
    required this.diagnosis,
  });

  Widget _buildEmptyText(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate('No Diagnosis'),
      style: AppTextStyle.bodySmall(context),
      textAlign: TextAlign.left,
    );
  }

  Widget _buildDiagnosis(BuildContext context) {
    return Text(
      diagnosis,
      style: AppTextStyle.bodySmall(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionCardContainer(
      title: AppLocalizations.of(context).translate('Diagnosis'),
      children: [
        diagnosis.isEmpty ? _buildEmptyText(context) : _buildDiagnosis(context),
      ],
    );
  }
}
