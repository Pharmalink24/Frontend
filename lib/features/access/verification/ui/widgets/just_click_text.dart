import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/styles.dart';

class JustClickText extends StatelessWidget {
  const JustClickText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      child: Text(
        "Just click on the link in that email to complete your signup. if you don't see it, you may need to check your spam folder.",
        style: AppTextStyle.bodyMedium,
      ),
    );
  }
}
