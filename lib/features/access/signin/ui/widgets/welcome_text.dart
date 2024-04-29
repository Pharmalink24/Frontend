import 'package:flutter/material.dart';
import 'package:pharmalink/generated/l10n.dart';
import '../../../../../core/theme/styles.dart';

const kPadding = 8.0;

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kPadding, horizontal: 0.0),
      child: Text(
        S.of(context).welcomeToPharmalink,
        style: AppTextStyle.labelMedium,
      ),
    );
  }
}
