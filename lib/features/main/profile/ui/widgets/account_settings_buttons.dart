import 'package:flutter/material.dart';
import 'package:pharmalink/features/main/profile/ui/widgets/account_settings_drop_down.dart';

import 'logout_button.dart';
import 'account_settings_button.dart';

class AccountSettingsButtons extends StatelessWidget {
  const AccountSettingsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AccountSettingsButton(text: 'Change Password'),
        AccountSettingsButton(text: 'Edit Profile'),
        LanguageDropDown(),
        LogoutButton(),
      ],
    );
  }
}