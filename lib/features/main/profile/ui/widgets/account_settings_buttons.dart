import 'package:flutter/material.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routes/routes.dart';
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
          onPressed: () => context.pushNamed(Routes.editProfileScreen),
        ),
        AccountSettingsButton(
          text: AppLocalizations.of(context).translate('changePassword'),
          onPressed: () => context.pushNamed(Routes.changePasswordScreen),
        ),
        const LanguageDropDown(),
        const LogoutButton(),
      ],
    );
  }
}
