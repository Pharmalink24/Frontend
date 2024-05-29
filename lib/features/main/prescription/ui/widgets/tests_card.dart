import 'package:flutter/material.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/widgets/card_container_with_title.dart';

class TestsCard extends StatelessWidget {
  final String tests;

  const TestsCard({
    super.key,
    required this.tests,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 100),
      child: CardContainerWithTitle(
        isScrollable: false,
        title: AppLocalizations.of(context).translate('Tests'),
        child: Column(
          children: [
            Text(tests),
          ],
        ),
      ),
    );
  }
}
