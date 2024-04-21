import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'account_settings_buttons.dart';
import 'account_settings_header.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 8.0),
      child: Container(
        color: AppColors.secondaryBackground,
        child: const Column(
          children: [
            AccountSettingsHeader(),
            AccountSettingsButtons(),
          ],
        ),
      ),
    );
  }
}
