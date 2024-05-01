// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

const kIconSize = 45.0;
const kContentMargin = 10.0;

class IconContent extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String label;
  final Color? labelColor;

  const IconContent({
    super.key,
    required this.icon,
    this.iconColor,
    required this.label,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor ?? Theme.of(context).colorScheme.onSecondary,
          size: kIconSize,
        ),
        const SizedBox(
          width: kContentMargin,
        ),
        Text(
          label,
          style: AppTextStyle.titleSmall(context).copyWith(
            color: labelColor ?? Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ],
    );
  }
}
