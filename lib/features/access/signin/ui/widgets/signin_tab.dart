import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/styles.dart';

class SigninTab extends StatelessWidget {
  const SigninTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: AppLocalizations.of(context).isEnLocale ? 0.0 : 16.0,
            right: AppLocalizations.of(context).isEnLocale ? 16.0 : 0.0,
            bottom: 12.0,
          ),
          child: Text(
            AppLocalizations.of(context).translate('signIn'),
            style: AppTextStyle.displaySmall(context).copyWith(
              fontFamily: AppFonts.getFont(context, Font.tertiary),
              color: AppColors.primaryText,
              fontSize: AppLocalizations.of(context).isEnLocale ? 36.0 : 26.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppLocalizations.of(context).isEnLocale ? 16.0 : 0.0,
            right: AppLocalizations.of(context).isEnLocale ? 0.0 : 16.0,
            bottom: 12.0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.signUpScreen);
            },
            child: Text(
              AppLocalizations.of(context).translate('signUp'),
              style: AppTextStyle.displaySmall(context).copyWith(
                fontFamily: AppFonts.getFont(context, Font.tertiary),
                color: AppColors.secondaryText,
                fontSize: AppLocalizations.of(context).isEnLocale ? 36.0 : 28.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
