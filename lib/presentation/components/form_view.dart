import "package:flutter/material.dart";

import '../../utilities/constants/styles.dart';
import '../classes/field.dart';
import 'rounded_drop_down_button.dart';
import 'rounded_text_field.dart';

class FormView extends StatefulWidget {
  final List<Field> model;
  const FormView({
    super.key,
    required this.model,
  });

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: ((context, index) {
        var field = widget.model[index].items != null
            ? RoundedDropDownButton(
                hintText: widget.model[index].name,
                value: widget.model[index].value,
                items: widget.model[index].items!,
                onChanged: (value) {
                  setState(() {
                    widget.model[index].value = value;
                  });
                })
            : RoundedTextField(
                hintText: widget.model[index].name,
                keyboardType: widget.model[index].inputType,
                onChanged: (value) {
                  setState(() {
                    widget.model[index].value = value;
                  });
                },
                decoration: AppTextFieldDecoration.primaryInputDecoration,
              );

        return field;
      }),
      itemCount: widget.model.length,
    );
  }
}
