import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'account_settings_drop_down.dart';
import '../../../../../core/localization/app_localizations.dart';
import 'logout_button.dart';
import 'account_settings_button.dart';

class AccountSettingsButtons extends StatelessWidget {
  const AccountSettingsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AccountSettingsButton(
          text: AppLocalizations.of(context).translate('editProfile'),
          onPressed: () => context.pushRoute(const EditProfileRoute()),
        ),
        AccountSettingsButton(
          text: AppLocalizations.of(context).translate('changePassword'),
          onPressed: () => context.pushRoute(const ChangePasswordRoute()),
        ),
        const LanguageDropDown(),
        const LogoutButton(),
      ],
    );
  }
}
