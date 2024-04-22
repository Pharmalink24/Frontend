import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class DatePicker extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
  final bool enableSuggestions;
  final bool autocorrect;
  final InputDecoration decoration;
  final Icon? icon;
  final TextEditingController? controller;
  final Function(String?) validator;

  const DatePicker({
    super.key,
    required this.hintText,
    required this.validator,
    required this.decoration,
    this.onChanged,
    this.controller,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.icon = const Icon(Icons.event),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
      child: DateTimePicker(
        controller: controller,
        autofocus: false,
        autocorrect: autocorrect,
        enableSuggestions: enableSuggestions,
        decoration: decoration.copyWith(
          hintText: hintText,
          labelText: hintText,
        ),
        style: AppTextStyle.labelSmall.copyWith(
          color: AppColors.secondary,
        ),
        type: DateTimePickerType.date,
        dateMask: 'yyyy-MM-dd',
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        icon: icon,
        dateLabelText: hintText,
        onChanged: onChanged,
        validator: (value) => validator(value),
      ),
    );
  }
}
