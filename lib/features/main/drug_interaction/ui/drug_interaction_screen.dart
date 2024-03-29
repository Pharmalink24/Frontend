// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/card_container.dart';
import 'package:pharmalink/core/widgets/card_container_column.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';
import 'package:pharmalink/features/main/drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import 'package:pharmalink/features/main/drug_interaction/ui/widgets/drug_interaction_form.dart';
import 'widgets/interaction_result_container.dart';

class DrugInteractionScreen extends StatefulWidget {
  const DrugInteractionScreen({super.key});

  @override
  State<DrugInteractionScreen> createState() => _DrugInteractionScreenState();
}

class _DrugInteractionScreenState extends State<DrugInteractionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryBackground,
      height: double.infinity,
      width: double.infinity,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          children: [
            CardContainerWithTitle(
              title: 'Interactions',
              style: AppTextStyle.displayMedium.copyWith(fontSize: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrugInteractionForm(),
                  FormButton(
                    onPressed: () => drugInteraction(context),
                    text: "Check",
                    color: AppColors.secondary,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    borderRadius: 8.0,
                    elevation: 5.0,
                  ),
                ],
              ),
            ),
            InteractionResultContainer(),
          ],
        ),
      ),
    );
  }

  void drugInteraction(BuildContext context) {
    context.read<DrugInteractionCubit>().emitDrugInteractionStates();
  }
}
