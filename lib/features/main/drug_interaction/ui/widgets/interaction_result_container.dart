import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class InteractionResultContainer extends StatelessWidget {
  final Icon interactionIcon;
  final String interactionTitle;
  final String interactionDescription;

  const InteractionResultContainer({
    super.key,
    required this.interactionIcon,
    required this.interactionTitle,
    required this.interactionDescription,
  });

  @override
  Widget build(BuildContext context) {
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
          interactionIcon,
          Text(
            interactionTitle,
            style: AppTextStyle.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            interactionDescription,
            style: AppTextStyle.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
