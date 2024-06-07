import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/drug_interaction_cubit.dart';
import 'drug_search_field.dart';
import '../../../../../core/localization/app_localizations.dart';

import 'form_input_label.dart';

class DrugInteractionBetweenTwoDrugs extends StatelessWidget {
  const DrugInteractionBetweenTwoDrugs({super.key});

  Widget _buildFirstInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormInputLabel(
          text: AppLocalizations.of(context).translate('firstDrug'),
        ),
        DrugSearchField(
          drugFieldId: DrugFieldId.betweenTwoDrugsFirst,
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
          drugFieldId: DrugFieldId.betweenTwoDrugsSecond,
          controller: context.read<DrugInteractionCubit>().drugController2,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Form(
        key: context.read<DrugInteractionCubit>().form1Key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFirstInput(context),
            _buildSecondInput(context),
          ],
        ),
      ),
    );
  }
}
