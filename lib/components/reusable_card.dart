// Flutter Packages
import 'package:flutter/material.dart';

const kCardMarginValue = 10.0;
const kCardPaddingValue = 10.0;
const kCardBorderRadius = 10.0;

class ReusableCard extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Color backgroundColor;

  ReusableCard({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed(),
        child: Container(
          padding: const EdgeInsets.all(kCardPaddingValue),
          margin: const EdgeInsets.all(kCardMarginValue),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(kCardBorderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}
