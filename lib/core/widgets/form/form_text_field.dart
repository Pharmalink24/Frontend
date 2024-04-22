// ignore_for_file: prefer_const_constructors

// Flutter Packages
import "package:flutter/material.dart";
// Utilities
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class FormTextField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final InputDecoration decoration;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final Function(String?) validator;

  const FormTextField({
    super.key,
    required this.hintText,
    required this.validator,
    this.onChanged,
    required this.decoration,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
          controller: controller,
          autofocus: false,
          obscureText: obscureText,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          decoration: decoration.copyWith(
            hintText: hintText,
            suffixIcon: suffixIcon,
            labelText: hintText,
          ),
          style: AppTextStyle.labelSmall.copyWith(
            color: AppColors.secondary,
          ),
          keyboardType: keyboardType,
          validator: (value) => validator(value),
        ),
      ),
    );
  }
}
