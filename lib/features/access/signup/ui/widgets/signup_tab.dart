import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/styles.dart';

class SignupTab extends StatelessWidget {
  const SignupTab({super.key});

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
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context).translate('signIn'),
              style: AppTextStyle.displaySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontFamily: AppFonts.getFont(context, Font.tertiary),
                fontSize: AppLocalizations.of(context).isEnLocale ? 36.0 : 26.0,
              ),
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
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context).translate('signUp'),
              style: AppTextStyle.displaySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontFamily: AppFonts.getFont(context, Font.tertiary),
                fontSize: AppLocalizations.of(context).isEnLocale ? 36.0 : 26.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
