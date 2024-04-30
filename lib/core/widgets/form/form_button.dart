// ignore_for_file: prefer_const_constructors

// Flutter Packages
import "package:flutter/material.dart";
// Utilities
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';

import '../../theme/colors.dart';

class FormButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Color color;
  final double? elevation;
  final double? borderRadius;
  final bool hideKeyboardWhenClicked;

  const FormButton({
    super.key,
    this.text = "",
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 24.0),
    this.color = AppColors.secondary,
    this.elevation,
    this.borderRadius,
    this.hideKeyboardWhenClicked = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(color),
            elevation: MaterialStatePropertyAll(elevation),
            shape: borderRadius != null
                ? MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                    ),
                  )
                : null,
          ),
          onPressed: () {
            if (hideKeyboardWhenClicked) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
            onPressed();
          },
          child: Text(
            text,
            style: AppTextStyle.titleSmall(context).copyWith(
              fontFamily: AppFonts.getFont(context, Font.tertiary),
            ),
          ),
        ),
      ),
    );
  }
}
