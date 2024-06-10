import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../theme/styles.dart';

class TextWithIcon extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final IconData icon;

  const TextWithIcon({
    super.key,
    this.onTap,
    this.text = '',
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            text,
            style: AppTextStyle.bodySmall(context),
          ),
          const SizedBox(width: 4.0), // SizedBox(
          Icon(
            icon,
            size: 24,
            color: context.colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}
