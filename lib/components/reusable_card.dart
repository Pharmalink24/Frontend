// Flutter Packages
import 'package:flutter/material.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';

const kCardMarginVertical = 10.0;
const kCardMarginHorizontal = 30.0;

const kCardBorderRadius = 35.0;

class ReusableCard extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Color backgroundColor;
  final Color borderColor;

  ReusableCard({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor = AppColors.tertiary,
    this.borderColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed(),
        child: Container(
          margin: const EdgeInsets.symmetric(
              vertical: kCardMarginVertical, horizontal: kCardMarginHorizontal),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            border: Border.all(
              color: borderColor,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
