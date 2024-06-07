import 'package:flutter/material.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/theme/styles.dart';
import '../../../../../../shared/presentation/widgets/expansion_card_container.dart';

class TestsCard extends StatelessWidget {
  final String tests;

  const TestsCard({
    super.key,
    required this.tests,
  });

  Widget _buildEmptyText(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate('No Tests'),
      style: AppTextStyle.bodySmall(context),
      textAlign: TextAlign.left,
    );
  }

  Widget _buildTests(BuildContext context) {
    return Text(
      tests,
      style: AppTextStyle.bodySmall(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionCardContainer(
      title: AppLocalizations.of(context).translate('Tests'),
      children: [
        tests.isEmpty ? _buildEmptyText(context) : _buildTests(context),
      ],
    );
  }
}
