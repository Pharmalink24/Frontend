import 'package:flutter/material.dart';

import '../../../../../core/theme/styles.dart';
import '../../../../../core/localization/app_localizations.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context).translate('forgetPassword'),
            style: AppTextStyle.labelMedium(context).copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
