import "package:flutter/material.dart";
import 'package:pharmalink/components/rounded_text_field.dart';
import 'package:pharmalink/models/input.dart';
import 'package:pharmalink/utilities/constants.dart';

class FormView extends StatelessWidget {
  List<Input> model;
  FormView({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return RoundedTextField(
          hintText: model[index].name,
          keyboardType: model[index].inputType,
          onChanged: (value) {
            model[index].value = value;
          },
          decoration: AppTextFieldDecoration.primaryDecoration,
        );
      }),
      itemCount: model.length,
    );
  }
}
