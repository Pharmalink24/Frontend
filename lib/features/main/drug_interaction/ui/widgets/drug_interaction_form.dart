import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_eye_search_response.dart';
import 'package:pharmalink/features/main/drug_interaction/logic/cubit/drug_interaction_cubit.dart';

import 'form_search_field.dart';

class DrugInteractionForm extends StatefulWidget {
  const DrugInteractionForm({super.key});

  @override
  State<DrugInteractionForm> createState() => _DrugInteractionFormState();
}

class _DrugInteractionFormState extends State<DrugInteractionForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: context.read<DrugInteractionCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'First Drug',
            textAlign: TextAlign.start,
            style: AppTextStyle.bodyMedium.copyWith(
              fontFamily: 'Readex Pro',
              fontSize: 24,
            ),
          ),
          FormSearchField(
            suggestionsCallback: (search) {
              return [DrugEyeSearchResponse(commercialName: "commercialName1")];
            },
            decoration: AppTextFieldDecoration.searchInputDecoration,
            controller: context.read<DrugInteractionCubit>().drug2Controller,
            labelText: "Please Select...",
          ),
          const Divider(
            thickness: 1,
            color: Color(0x00FFFFFF),
          ),
          Text(
            'Second Drug',
            textAlign: TextAlign.start,
            style: AppTextStyle.bodyMedium.copyWith(
              fontFamily: 'Readex Pro',
              fontSize: 24,
            ),
          ),
          FormSearchField(
            suggestionsCallback: (search) {
              return [DrugEyeSearchResponse(commercialName: "commercialName2")];
            },
            decoration: AppTextFieldDecoration.searchInputDecoration,
            controller: context.read<DrugInteractionCubit>().drug1Controller,
            labelText: "Please Select...",
          ),
        ],
      ),
    );
  }
}
