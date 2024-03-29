
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

import '../theme/fonts.dart';
import 'card_container.dart';

class CardContainerWithTitle extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final Widget child;
  const CardContainerWithTitle({
    super.key,
    required this.title,
    this.style,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
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
    );
  }
}
