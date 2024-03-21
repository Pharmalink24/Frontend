import 'package:flutter/material.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FormButton(
      text: "Sign In",
      onPressed: () async {},
    );
  }
}
