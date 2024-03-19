// Flutter Packages
import 'package:flutter/material.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';

const kIconSize = 45.0;
const kContentMargin = 10.0;

class IconContent extends StatelessWidget {
  final IconData? icon;
  final Color iconColor;
  final String label;
  final Color labelColor;

  IconContent({
    super.key,
    required this.icon,
    this.iconColor = AppColors.alternate,
    required this.label,
    this.labelColor = AppColors.alternate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: kIconSize,
        ),
        const SizedBox(
          width: kContentMargin,
        ),
        Text(
          label,
          style: AppTextStyle.cardLabelTextStyle.copyWith(
            color: labelColor,
          ),
        ),
      ],
    );
  }
}
