import 'package:flutter/material.dart';
import 'package:pharmalink/generated/l10n.dart';
import '../../../../../core/theme/styles.dart';

class JustClickText extends StatelessWidget {
  const JustClickText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Text(
        S.of(context).justClickOnTheLink,
        style: AppTextStyle.bodyMedium,
      ),
    );
  }
}
