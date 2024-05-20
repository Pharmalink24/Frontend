import 'package:flutter/material.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/card_container_with_title.dart';
import '../../../../../core/localization/app_localizations.dart';
import 'drug_interaction_inputs.dart';

class DrugInteractionForm extends StatelessWidget {
  const DrugInteractionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainerWithTitle(
      title: AppLocalizations.of(context).translate('drugInteractionTitle'),
      textStyle: AppTextStyle.displayMedium(context).copyWith(fontSize: 40),
      isScrollable: false,
      child: const DrugInteractionInputs(),
    );
  }
}
