import 'package:flutter/material.dart';
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
        'Welcome to PharmaLink, where you manage your prescriptions !',
        style: AppTextStyle.labelMedium(context),
      ),
    );
  }
}
