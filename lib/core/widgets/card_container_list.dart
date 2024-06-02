// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';

class CardContainerList extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget child;
  final Function()? onPressed;

  const CardContainerList({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(12.0),
    this.margin = const EdgeInsets.symmetric(vertical: 8.0),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: context.colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow,
              blurRadius: 5.0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
