// ignore_for_file: prefer_const_constructors

// Flutter Packages
import "package:flutter/material.dart";
// Utilities
import 'package:pharmalink/utilities/constants.dart';

class RoundedDropDownButton extends StatelessWidget {
  final String? hintText;
  final String? value;
  final List<String> items;
  final Function onChanged;

  const RoundedDropDownButton({
    super.key,
    this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: Container(
        decoration: AppTextFieldDecoration.primaryBoxDecoration,
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
          style: AppTextStyle.subtitle.copyWith(
            color: AppColors.secondary,
          ),
          underline: SizedBox(),
        ),
      ),
    );
  }
}
