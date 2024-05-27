import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/styles.dart';
import '../../logic/cubit/drug_interaction_cubit.dart';
import 'drug_search_field.dart';

class DrugInteraction1Input extends StatelessWidget {
  const DrugInteraction1Input({super.key});

  Widget _buildDescription(BuildContext context) {
    return Text(
      "This page helps you decide whether a certain medication might interact with another medication you're currently using.",
      style: AppTextStyle.labelMedium(context),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildFirstInput(BuildContext context) {
    return DrugSearchField(
      drugFieldId: 1,
      controller: context.read<DrugInteractionCubit>().drugController1,
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
        key: context.read<DrugInteractionCubit>().form2Key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDescription(context),
            const SizedBox(height: 64),
            _buildFirstInput(context),
          ],
        ),
      ),
    );
  }
}
