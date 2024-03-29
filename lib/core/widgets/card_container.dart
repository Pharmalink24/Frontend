// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';

class CardContainer extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final Widget child;

  const CardContainer({
    super.key,
    required this.title,
    required this.child,
    this.style,
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
                style: style ??
                    AppTextStyle.bodyMedium.copyWith(
                      fontFamily: AppFonts.secondary,
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                color: AppColors.secondaryText,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: child,
          ),
        ],
      ),
    );
  }
}
