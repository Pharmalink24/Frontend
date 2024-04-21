import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/styles.dart';

class FormInputLabel extends StatelessWidget {
  final String text;
  const FormInputLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: AppTextStyle.bodyMedium.copyWith(
          fontFamily: 'Readex Pro',
          fontSize: 24,
        ),
      ),
    );
  }
}