import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/models/drug_info.dart';
import '../../../../../core/widgets/card_container_with_title.dart';

import 'drug_card.dart';

class DrugsListCard extends StatelessWidget {
  final Map<String, DrugInfo> drugs;
  const DrugsListCard({super.key, required this.drugs});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: CardContainerWithTitle(
        title: AppLocalizations.of(context).translate('Drugs'),
        isScrollable: false,
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: drugs.entries
                  .map(
                    (drug) => DrugCard(
                      tradeName: drug.key,
                      drugInfo: drug.value,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
