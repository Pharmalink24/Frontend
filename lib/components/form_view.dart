import "package:flutter/material.dart";
import 'package:pharmalink/components/rounded_drop_down_button.dart';
import 'package:pharmalink/components/rounded_text_field.dart';
import 'package:pharmalink/models/input.dart';
import 'package:pharmalink/utilities/constants.dart';

class FormView extends StatefulWidget {
  final List<Input> model;
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
