// ignore_for_file: prefer_const_constructors

// Flutter Packages
import "package:flutter/material.dart";
// Utilities
import 'package:pharmalink/utilities/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;

  const RoundedButton({
    super.key,
    this.text = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      child: TextButton(
        onPressed: () {},
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
    );
  }
}
