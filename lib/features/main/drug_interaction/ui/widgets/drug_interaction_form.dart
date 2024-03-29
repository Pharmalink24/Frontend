import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/main/drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import 'package:pharmalink/features/main/drug_interaction/ui/widgets/drug_search_field.dart';

import 'form_input_label.dart';

class DrugInteractionForm extends StatefulWidget {
  const DrugInteractionForm({super.key});

  @override
  State<DrugInteractionForm> createState() => _DrugInteractionFormState();
}

class _DrugInteractionFormState extends State<DrugInteractionForm> {
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
            color: Color(0x00FFFFFF),
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
