import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/styles.dart';
import '../../logic/cubit/drug_interaction_cubit.dart';
import 'drug_search_field.dart';
import '../../../../../core/localization/app_localizations.dart';

import 'form_input_label.dart';

class DrugInteraction2Inputs extends StatelessWidget {
  const DrugInteraction2Inputs({super.key});

  Widget _buildDescription(BuildContext context) {
    return Text(
      "This page helps you check interaction between a pair of medications.",
      style: AppTextStyle.labelMedium(context),
      textAlign: TextAlign.center,
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Form(
        key: context.read<DrugInteractionCubit>().form1Key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDescription(context),
            const SizedBox(height: 16),
            _buildFirstInput(context),
            const SizedBox(height: 16),
            _buildSecondInput(context),
          ],
        ),
      ),
    );
  }
}
