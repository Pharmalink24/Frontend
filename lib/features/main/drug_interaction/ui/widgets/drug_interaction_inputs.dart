import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/main/drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import 'package:pharmalink/features/main/drug_interaction/ui/widgets/drug_search_field.dart';

import 'form_input_label.dart';

class DrugInteractionInputs extends StatefulWidget {
  const DrugInteractionInputs({super.key});

  @override
  State<DrugInteractionInputs> createState() => _DrugInteractionInputsState();
}

class _DrugInteractionInputsState extends State<DrugInteractionInputs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: context.read<DrugInteractionCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormInputLabel(text: 'First Drug'),
          DrugSearchField(
            drugFieldId: 1,
            controller: context.read<DrugInteractionCubit>().drugController1,
          ),
          const Divider(
            thickness: 1,
            color: AppColors.transparent,
          ),
          const FormInputLabel(text: 'Second Drug'),
          DrugSearchField(
            drugFieldId: 2,
            controller: context.read<DrugInteractionCubit>().drugController2,
          ),
        ],
      ),
    );
  }
}
