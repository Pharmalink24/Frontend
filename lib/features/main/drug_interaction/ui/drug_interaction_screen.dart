// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/card_container.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';
import 'package:pharmalink/features/access/signin/logic/cubit/signin_cubit.dart';
import 'package:pharmalink/features/main/drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import 'package:pharmalink/features/main/drug_interaction/ui/widgets/drug_interaction_form.dart';

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
            padding: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 16),
            children: [
              CardContainer(
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
                      color: AppColors.primary,
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      size: 60.0,
                      color: AppColors.warning,
                    ),
                    Text(
                      "Risky",
                      style: AppTextStyle.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "This interaction can increase the risk of bleeding.",
                      style: AppTextStyle.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  void drugInteraction(BuildContext context) {
    context.read<DrugInteractionCubit>().emitDrugInteractionStates();
  }
}
