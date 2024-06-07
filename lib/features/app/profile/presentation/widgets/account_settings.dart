import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'account_settings_buttons.dart';
import 'account_settings_header.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 8.0),
      child: Column(
        children: [
          AccountSettingsHeader(),
          AccountSettingsButtons(),
        ],
      ),
    );
  }
}
