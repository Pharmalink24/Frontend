import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/features/main/profile/ui/widgets/account_settings_drop_down.dart';

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
          text: 'Edit Profile',
          onPressed: () => context.pushNamed(Routes.editProfileScreen),
        ),
        AccountSettingsButton(
          text: 'Change Password',
          onPressed: () => context.pushNamed(Routes.changePasswordScreen),
        ),
        const LanguageDropDown(),
        const LogoutButton(),
      ],
    );
  }
}
