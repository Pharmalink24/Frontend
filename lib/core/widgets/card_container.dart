// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';

class CardContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget iconButton;

  const CardContainer({
    super.key,
    required this.title,
    required this.child,
    this.iconButton = const SizedBox.shrink(),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyle.bodyMedium.copyWith(
                  fontFamily: AppFonts.secondary,
                  fontSize: 25,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              iconButton
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: child,
          ),
        ],
      ),
    );
  }
}
