import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/styles.dart';

import '../theme/fonts.dart';
import 'card_container.dart';

class CardContainerWithTitle extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget iconButton;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const CardContainerWithTitle({
    super.key,
    required this.title,
    required this.child,
    this.iconButton = const SizedBox.shrink(),
    this.padding = const EdgeInsets.all(12.0),
    this.margin = const EdgeInsets.all(12.0),
    this.textStyle,
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
              style: textStyle ??
                  AppTextStyle.bodyMedium.copyWith(
                    fontFamily: AppFonts.secondary,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            iconButton
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
