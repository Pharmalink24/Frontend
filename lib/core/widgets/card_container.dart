// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';

class CardContainer extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const CardContainer({
    super.key,
    required this.title,
    this.textStyle,
    required this.child,
    this.padding = const EdgeInsets.all(12.0),
    this.margin = const EdgeInsets.all(12.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      margin: margin,
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
                style: textStyle ??
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
          Container(
            padding: const EdgeInsets.only(top: 16.0),
            child: child,
          ),
        ],
      ),
    );
  }
}
