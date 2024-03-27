import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/styles.dart';

class PleaseVerifyText extends StatelessWidget {
  const PleaseVerifyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Text(
        "Please verify your email",
        style: AppTextStyle.displayMedium.copyWith(fontSize: 28.0),
      ),
    );
  }
}
