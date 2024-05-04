import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/card_container_with_title.dart';
import '../../../../../core/widgets/form/form_button.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../logic/cubit/drug_interaction_cubit.dart';
import 'drug_interaction_inputs.dart';

class DrugInteractionForm extends StatelessWidget {
  const DrugInteractionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainerWithTitle(
      title: AppLocalizations.of(context).translate('drugInteractionTitle'),
      textStyle: AppTextStyle.displayMedium(context).copyWith(fontSize: 40),
      flex: 7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DrugInteractionInputs(),
          const SizedBox(height: 16.0),
          FormButton(
            onPressed: () => drugInteraction(context),
            text: AppLocalizations.of(context).translate('checkInteractions'),
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            borderRadius: 8.0,
            height: null,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  void drugInteraction(BuildContext context) {
    context.read<DrugInteractionCubit>().emitDrugInteractionStates();
  }
}
