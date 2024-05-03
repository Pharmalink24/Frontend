import 'package:flutter/material.dart';
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
            style: AppTextStyle.bodyMedium(context),
          ),
          const SizedBox(width: 4.0), // SizedBox(
          Icon(
            icon,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
