import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../shared/domain/entities/models/drug_info.dart';
import '../../../../../../core/theme/styles.dart';
import '../../../../../../shared/presentation/widgets/expansion_card_container.dart';
import 'drug_card.dart';

class DrugsListCard extends StatelessWidget {
  final int prescriptionId;
  final Map<String, DrugInfo> drugs;

  const DrugsListCard({
    super.key,
    required this.prescriptionId,
    required this.drugs,
  });

  Widget _buildEmptyList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.featured_play_list_rounded,
          size: 60,
          color: context.colorScheme.onSecondary,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context).translate('noDrugsFound'),
            textAlign: TextAlign.center,
            style: AppTextStyle.bodyLarge(context).copyWith(
              color: context.colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDrugsList(BuildContext context) {
    return Column(
      children: drugs.entries.map((MapEntry<String, DrugInfo> entry) {
        return DrugCard(
          prescriptionId: prescriptionId,
          tradeName: entry.key,
          drugInfo: entry.value,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionCardContainer(
      title: AppLocalizations.of(context).translate('Drugs'),
      children: [
        drugs.isEmpty ? _buildEmptyList(context) : _buildDrugsList(context),
      ],
    );
  }
}
