import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/loading_indicator.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_interaction_response.dart';
import 'package:pharmalink/features/main/drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import 'package:pharmalink/features/main/drug_interaction/logic/cubit/drug_interaction_state.dart';

class InteractionResultContainer extends StatelessWidget {
  const InteractionResultContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrugInteractionCubit, DrugInteractionState>(
      builder: (context, state) {
        if (state is DrugInteractionSuccess) {
          return showSuccess((state).data);
        } else if (state is Error) {
          return showError((state).error);
        } else if (state is Loading) {
          return const LoadingIndicator();
        } else {
          return defaultWidget();
        }
      },
    );
  }

  Widget showSuccess(DrugInteractionResponse interactionResult) {
    // Show success dialog
    return Container(
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
          const Icon(
            Icons.info,
            size: 40,
            color: AppColors.success,
          ),
          Text(
            interactionResult.message,
            style: AppTextStyle.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            interactionResult.message,
            style: AppTextStyle.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget showError(String error) {
    // Show success dialog
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_sharp,
            size: 40,
            color: AppColors.error,
          ),
          Text(
            'There is Error',
            style: AppTextStyle.displaySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget defaultWidget() {
    // Show success dialog
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: const Text(
        'Enter 2 Drugs to check interaction between them',
        style: AppTextStyle.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
