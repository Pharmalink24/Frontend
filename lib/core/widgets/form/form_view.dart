import "package:flutter/material.dart";
import 'package:pharmalink/core/helpers/classes/field_type.dart';

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

class _FormViewState extends State<FormView> {
  late InputDecoration inputDecoration;
  late BoxDecoration boxDecoration;
  final Map<String, bool> _isVisible = {};

  @override
  void initState() {
    super.initState();
    setupDecoration();

    widget.model.forEach((key, field) {
      if (isPasswordField(field)) {
        _isVisible[key] = false;
      }
    });
  }

  // Setup the decoration of fields
  void setupDecoration() {
    if (widget.decorationType == DecorationType.primary) {
      inputDecoration = AppTextFieldDecoration.primaryInputDecoration;
      boxDecoration = AppTextFieldDecoration.primaryBoxDecoration;
    } else {
      inputDecoration = AppTextFieldDecoration.secondaryInputDecoration;
      boxDecoration = AppTextFieldDecoration.secondaryBoxDecoration;
    }
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
      hintText: field.name,
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
            return field.errorMessage ?? "Invalid ${field.name}.";
          } else if (isConfirm(field)) {
            if (value !=
                widget.model[field.confirmationValue!]!.controller!.text) {
              return field.confirmationErrorMessage ?? "${widget.model[field.confirmationValue!]!.name}s do not match.";
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
      hintText: field.name,
      value: field.value,
      items: field.items!,
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
      hintText: field.name,
      controller: field.controller,
      validator: (value) {
        return field.regex != null
            ? !field.regex!.hasMatch(value!)
                ? field.errorMessage ?? "Invalid ${field.name}."
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
