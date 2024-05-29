import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/models/drug_info.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/card_container_with_title.dart';

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
          size: 80,
          color: context.colorScheme.onSecondary,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context).translate('noDrugsFound'),
            textAlign: TextAlign.center,
            style: AppTextStyle.headlineSmall(context).copyWith(
              color: context.colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDrugsList(BuildContext context) {
    return ListView.builder(
      itemCount: drugs.length,
      itemBuilder: (context, index) {
        final tradeName = drugs.keys.toList()[index];
        final drugInfo = drugs.values.toList()[index];
        return DrugCard(
          prescriptionId: prescriptionId,
          tradeName: tradeName,
          drugInfo: drugInfo,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainerWithTitle(
      title: AppLocalizations.of(context).translate('Drugs'),
      isScrollable: false,
      child:
          drugs.isEmpty ? _buildEmptyList(context) : _buildDrugsList(context),
    );
  }
}
