// ignore_for_file: prefer_const_constructors

// Flutter Packages
import "package:flutter/material.dart";
// Utilities
import 'package:pharmalink/core/theme/fonts.dart';

class FormButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  const FormButton({
    super.key,
    this.text = "",
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 24.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: TextButton(
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
