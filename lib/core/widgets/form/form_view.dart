import "package:flutter/material.dart";

import '../../theme/styles.dart';
import '../../helpers/classes/field.dart';
import 'form_drop_down_button.dart';
import 'form_text_field.dart';

enum DecorationType {
  primary,
  secondary,
}

class FormView extends StatefulWidget {
  final DecorationType decorationType;
  final List<Field> model;
  const FormView({
    super.key,
    required this.model,
    this.decorationType = DecorationType.primary,
  });

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final formKey = GlobalKey<FormState>();
  late InputDecoration inputDecoration;
  late BoxDecoration boxDecoration;
  late bool _isVisible;

  @override
  void initState() {
    super.initState();
    setupDecoration();
    _isVisible = false;
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

  // Check if field is drop down menu button ?
  bool isDropDownMenu(Field field) {
    return field.items == null;
  }

  // Check if field is password ?
  bool isPasswordField(Field field) {
    return field.inputType == TextInputType.visiblePassword;
  }

  // Generate form text field
  FormTextField generateFormTextField(Field field) {
    return FormTextField(
      decoration: inputDecoration,
      hintText: field.name,
      keyboardType: field.inputType,
      suffixIcon: isPasswordField(field)
          ? IconButton(
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              icon: Icon(_isVisible ? Icons.visibility : Icons.visibility_off))
          : null,
      obscureText: isPasswordField(field)
          ? !_isVisible
              ? true
              : false
          : false,
      onChanged: (value) {
        setState(() {
          field.value = value;
        });
      },
    );
  }

  // Generate drop down menu button
  FormDropDownButton generateDropDownButton(Field field) {
    return FormDropDownButton(
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: ((context, index) {
          Field field = widget.model[index];
          return isDropDownMenu(field)
              ? generateFormTextField(field)
              : generateDropDownButton(field);
        }),
        itemCount: widget.model.length,
      ),
    );
  }
}
