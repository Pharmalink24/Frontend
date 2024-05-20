import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/form/form_button.dart';
import '../../logic/cubit/drug_interaction_cubit.dart';
import 'drug_search_field.dart';
import '../../../../../core/localization/app_localizations.dart';

import 'form_input_label.dart';

class DrugInteractionInputs extends StatelessWidget {
  const DrugInteractionInputs({super.key});

  Widget _buildFirstInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormInputLabel(
          text: AppLocalizations.of(context).translate('firstDrug'),
        ),
        DrugSearchField(
          drugFieldId: 1,
          controller: context.read<DrugInteractionCubit>().drugController1,
        ),
      ],
    );
  }

  Widget _buildSecondInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormInputLabel(
          text: AppLocalizations.of(context).translate('secondDrug'),
        ),
        DrugSearchField(
          drugFieldId: 2,
          controller: context.read<DrugInteractionCubit>().drugController2,
        ),
      ],
    );
  }

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
    return Form(
      key: context.read<DrugInteractionCubit>().formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFirstInput(context),
          _buildSecondInput(context),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  void drugInteraction(BuildContext context) {
    context.read<DrugInteractionCubit>().emitDrugInteractionStates();
  }
}
