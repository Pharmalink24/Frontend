import 'package:flutter/material.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/widgets/card_container_with_title.dart';

class DiagnosisCard extends StatelessWidget {
  final String diagnosis;

  const DiagnosisCard({
    super.key,
    required this.diagnosis,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 100),
      child: CardContainerWithTitle(
        isScrollable: false,
        title: AppLocalizations.of(context).translate('Diagnosis'),
        child: Column(
          children: [
            Text(diagnosis),
          ],
        ),
      ),
    );
  }
}