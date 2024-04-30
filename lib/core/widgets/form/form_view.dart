import "package:flutter/material.dart";
import 'package:pharmalink/core/helpers/classes/field_type.dart';
import 'package:pharmalink/core/helpers/mixins.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';

import '../../theme/styles.dart';
import '../../helpers/classes/field.dart';
import 'date_picker.dart';
import 'form_drop_down_button.dart';
import 'form_text_field.dart';

enum DecorationType {
  primary,
  secondary,
}

class FormView extends StatefulWidget {
  final Key? formKey;
  final Map<String, Field> model;
  final DecorationType decorationType;

  const FormView({
    super.key,
    this.formKey,
    required this.model,
    this.decorationType = DecorationType.primary,
  });

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> with PostFrameMixin {
  late InputDecoration inputDecoration;
  late BoxDecoration boxDecoration;
  final Map<String, bool> _isVisible = {};

  String fieldName(BuildContext context, Field field) {
    return AppLocalizations.of(context).isEnLocale
        ? field.name
        : field.arabicName ?? field.name;
  }

  @override
  void initState() {
    super.initState();
    widget.model.forEach((key, field) {
      if (isPasswordField(field)) {
        _isVisible[key] = false;
      }
    });
  }

  // Setup the decoration of fields
  void setupDecoration() {
    inputDecoration = widget.decorationType == DecorationType.primary
        ? AppTextFieldDecoration.primaryInputDecoration(context)
        : AppTextFieldDecoration.secondaryInputDecoration(context);
    boxDecoration = widget.decorationType == DecorationType.primary
        ? AppTextFieldDecoration.primaryBoxDecoration(context)
        : AppTextFieldDecoration.secondaryBoxDecoration(context);
  }

  // Check if field is confirm ?
  bool isConfirm(Field field) {
    return field.confirmationValue != null;
  }

  // Check if field is drop down menu button ?
  bool isDropDownMenu(Field field) {
    return field.inputType == FieldType.dropdown;
  }

  // Check if field is date ?
  bool isDate(Field field) {
    return field.inputType == FieldType.date;
  }

  // Check if field is password ?
  bool isPasswordField(Field field) {
    return field.inputType == FieldType.password;
  }

  // Generate form text field
  FormTextField generateFormTextField(String key, Field field) {
    return FormTextField(
      decoration: inputDecoration,
      hintText: fieldName(context, field),
      keyboardType: field.textInputType ?? TextInputType.text,
      suffixIcon: isPasswordField(field)
          ? IconButton(
              onPressed: () {
                setState(
                  () {
                    _isVisible[key] = !_isVisible[key]!;
                  },
                );
              },
              icon: Icon(
                _isVisible[key]! ? Icons.visibility : Icons.visibility_off,
              ),
            )
          : null,
      obscureText: isPasswordField(field)
          ? !_isVisible[key]!
              ? true
              : false
          : false,
      controller: field.controller,
      validator: (value) {
        if (field.regex != null) {
          if (!field.regex!.hasMatch(value!)) {
            return field.errorMessage ??
                "Invalid ${fieldName(context, field)}.";
          } else if (isConfirm(field)) {
            if (value !=
                widget.model[field.confirmationValue!]!.controller!.text) {
              return field.confirmationErrorMessage ??
                  "${widget.model[field.confirmationValue!]!.name}s do not match.";
            } else {
              return null;
            }
          } else {
            return null;
          }
        } else {
          return null;
        }
      },
      onChanged: (value) {
        field.value = value;
      },
    );
  }

  // Generate drop down menu button
  FormDropDownButton generateDropDownButton(Field field) {
    return FormDropDownButton(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      decoration: boxDecoration,
      hintText: fieldName(context, field),
      value: field.value,
      items: field.items!,
      controller: field.controller,
      onChanged: (value) {
        setState(() {
          field.value = value;
        });
      },
    );
  }

  // Generate date picker
  DatePicker generateDatePicker(Field field) {
    return DatePicker(
      decoration: inputDecoration,
      hintText: fieldName(context, field),
      controller: field.controller,
      validator: (value) {
        return field.regex != null
            ? !field.regex!.hasMatch(value!)
                ? field.errorMessage ?? "Invalid ${fieldName(context, field)}"
                : null
            : null;
      },
      onChanged: (value) {
        field.value = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setupDecoration();
    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: ((context, index) {
          Field field = widget.model.values.elementAt(index);
          String key = widget.model.keys.elementAt(index);
          return isDropDownMenu(field)
              ? generateDropDownButton(field)
              : isDate(field)
                  ? generateDatePicker(field)
                  : generateFormTextField(key, field);
        }),
        itemCount: widget.model.length,
      ),
    );
  }
}
