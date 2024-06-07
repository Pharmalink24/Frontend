import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/styles.dart';
import '../logic/drug_interaction_cubit.dart';
import 'drug_search_field.dart';

class DrugInteractionWithMedications extends StatelessWidget {
  const DrugInteractionWithMedications({super.key});

  Widget _buildDescription(BuildContext context) {
    return Text(
      "We helps you decide whether a medication might interact with another medication you're currently using.",
      style: AppTextStyle.labelMedium(context),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildInput(BuildContext context) {
    return DrugSearchField(
      drugFieldId: DrugFieldId.withMedication,
      controller: context.read<DrugInteractionCubit>().drugController0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<DrugInteractionCubit>().form2Key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDescription(context),
          const SizedBox(height: 16),
          _buildInput(context),
        ],
      ),
    );
  }
}
