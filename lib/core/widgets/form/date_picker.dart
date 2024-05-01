import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:date_field/date_field.dart';

class DatePicker extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
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
    this.icon = const Icon(Icons.event),
  });

  String dateFormatter(DateTime? date) {
    if (date == null) {
      return '';
    }
    return '${date.year}-${date.month}-${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
      child: DateTimeFormField(
        mode: DateTimeFieldPickerMode.date,
        decoration: decoration.copyWith(
          hintText: hintText,
          labelText: hintText,
          helperText: 'yyyy-MM-dd',
        ),
        autofocus: false,
        style: AppTextStyle.bodySmall(context),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        onChanged: (value) {
          var date = dateFormatter(value);

          controller?.text = date;
          if (onChanged != null) onChanged!(date);
        },
        validator: (value) {
          var date = dateFormatter(value);
          return validator(date);
        },
      ),
    );
  }
}
