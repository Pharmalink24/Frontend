import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/localization/app_localizations.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 12.0),
      child: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context).translate('forgetPassword'),
            style: AppTextStyle.labelMedium(context).copyWith(
              color: AppColors.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
