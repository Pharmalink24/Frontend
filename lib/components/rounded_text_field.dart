// ignore_for_file: prefer_const_constructors

// Flutter Packages
import "package:flutter/material.dart";
// Utilities
import 'package:pharmalink/utilities/constants.dart';

const double _kBorderRadius = 40.0;

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final InputDecoration decoration;

  RoundedTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    required this.onChanged,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          onChanged: (value) {
            onChanged(value);
          },
          autofocus: false,
          obscureText: obscureText,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          decoration: decoration.copyWith(
            hintText: hintText,
            labelText: hintText,
          ),
          style: AppTextStyle.subtitle.copyWith(
            color: AppColors.secondary,
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }
}
