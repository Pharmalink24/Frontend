// Flutter Packages
// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
// Utilities
import 'package:pharmalink/utilities/constants.dart';

const double _kBorderRadius = 12.0;
const double _kBorderWidth = 2.0;
const double _kPadding = 24.0;

class FlatTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;

  FlatTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: Container(
        width: double.infinity,
        height: 50.0,
        child: TextFormField(
          autofocus: false,
          obscureText: obscureText,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: hintText,
            labelStyle: TextStyle(
              fontFamily: AppFonts.tertiary,
              color: AppColors.secondaryText,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryBackground,
                width: _kBorderWidth,
              ),
              borderRadius: BorderRadius.circular(_kBorderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.accent1,
                width: _kBorderWidth,
              ),
              borderRadius: BorderRadius.circular(_kBorderRadius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.error,
                width: _kBorderWidth,
              ),
              borderRadius: BorderRadius.circular(_kBorderRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.error,
                width: _kBorderWidth,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            filled: true,
            fillColor: AppColors.primaryBackground,
            contentPadding: EdgeInsets.all(_kPadding),
          ),
          style: TextStyle(
            fontFamily: AppFonts.tertiary,
            color: AppColors.secondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }
}
