import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../shared/presentation/widgets/form/form_button.dart';
import '../logic/drug_interaction_cubit.dart';
import '../widgets/drug_interaction_inputs_tab.dart';
import '../widgets/interaction_result_container.dart';

class DrugInteractionWidget extends StatelessWidget {
  const DrugInteractionWidget({super.key});

  Widget _buildSubmitButton(BuildContext context) {
    return FormButton(
      onPressed: () => drugInteraction(context),
      text: AppLocalizations.of(context).translate('checkInteractions'),
      padding: EdgeInsets.zero,
      borderRadius: 8.0,
      height: null,
      width: double.infinity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: DrugInteractionInputsTab(),
            ),
            const Expanded(
              flex: 2,
              child: InteractionResultContainer(),
            ),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  void drugInteraction(BuildContext context) {
    if (context.read<DrugInteractionCubit>().selectedTabIndex == 0) {
      context.read<DrugInteractionCubit>().emitOneDrugInteractionStates();
    } else if (context.read<DrugInteractionCubit>().selectedTabIndex == 1) {
      context.read<DrugInteractionCubit>().emitTwoDrugInteractionStates();
    }
  }
}
