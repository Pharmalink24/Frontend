// ignore_for_file: prefer_const_constructors

// Flutter Packages
import "package:flutter/material.dart";
// Utilities
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class FormDropDownButton extends StatelessWidget {
  final String? hintText;
  final String? value;
  final Map<String, String> items;
  final Function onChanged;
  final BoxDecoration decoration;
  final EdgeInsetsGeometry? padding;

  const FormDropDownButton({
    super.key,
    this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.decoration,
    this.padding,
  });

  List<DropdownMenuItem<String>> buildItemsWidget(Map<String, String> items) {
    return items.entries
        .map(
          (entry) => DropdownMenuItem(
            value: entry.key,
            child: Text(entry.value),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: Container(
        decoration: decoration,
        width: double.infinity,
        child: DropdownButton(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.secondary,
            size: 24,
          ),
          hint: Text(hintText ?? ""),
          padding: padding,
          value: value ?? items.keys.elementAt(0),
          onChanged: (value) {
            onChanged(value);
          },
          //
          items: buildItemsWidget(items),
          style: AppTextStyle.bodyMedium.copyWith(
            color: AppColors.secondary,
          ),
          underline: SizedBox(),
          elevation: 5,
          isExpanded: true,
        ),
      ),
    );
  }
}
