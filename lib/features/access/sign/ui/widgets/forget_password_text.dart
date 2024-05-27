import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/theme/colors.dart';

import '../../../../../core/routes/routes.dart';
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
          onTap: () => context.pushNamed(Routes.forgetPasswordScreen),
          child: Text(
            AppLocalizations.of(context).translate('forgetPassword'),
            style: AppTextStyle.labelMedium(context).copyWith(
              color: context.colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
