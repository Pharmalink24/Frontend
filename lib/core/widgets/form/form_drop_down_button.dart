// ignore_for_file: prefer_const_constructors

// Flutter Packages
import "package:flutter/material.dart";
// Utilities
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class FormDropDownButton extends StatelessWidget {
  final String? hintText;
  final String? value;
  final List<String> items;
  final Function onChanged;
  final BoxDecoration decoration;

  const FormDropDownButton({
    super.key,
    this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: Container(
        decoration: decoration,
        width: double.infinity,
        child: DropdownButton(
          hint: Text(hintText ?? ""),
          padding: EdgeInsets.all(16.0),
          value: value ?? items[0],
          onChanged: (value) {
            onChanged(value);
          },
          items: items
              .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
              .toList(),
          style: AppTextStyle.bodyMedium.copyWith(
            color: AppColors.secondary,
          ),
          underline: SizedBox(),
        ),
      ),
    );
  }
}
