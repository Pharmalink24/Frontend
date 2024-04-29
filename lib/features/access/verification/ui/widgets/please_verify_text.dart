import 'package:flutter/material.dart';
import 'package:pharmalink/generated/l10n.dart';
import '../../../../../core/theme/styles.dart';

class PleaseVerifyText extends StatelessWidget {
  const PleaseVerifyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Text(
        S.of(context).pleaseVerifyEmail,
        style: AppTextStyle.displayMedium.copyWith(fontSize: 28.0),
      ),
    );
  }
}
