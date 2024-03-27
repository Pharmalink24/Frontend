// ignore_for_file: prefer_const_constructors

// Flutter Packages
import "package:flutter/material.dart";
// Utilities
import 'package:pharmalink/core/theme/fonts.dart';

import '../../theme/colors.dart';

class FormButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Color color;
  final double? elevation;
  final double? borderRadius;

  const FormButton({
    super.key,
    this.text = "",
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 24.0),
    this.color = AppColors.secondary,
    this.elevation,
    this.borderRadius,
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
            onPressed();
          },
          child: Text(
            text,
            style: TextStyle(
              fontFamily: AppFonts.tertiary,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
