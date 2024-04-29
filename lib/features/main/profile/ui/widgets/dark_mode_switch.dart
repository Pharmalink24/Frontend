
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/generated/l10n.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).switchToDarkMode,
            style: AppTextStyle.bodyMedium,
          ),
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
            // trackColor: const MaterialStatePropertyAll(
            //   AppColors.primaryBackground,
            // ),
            // trackOutlineColor:
            //     MaterialStatePropertyAll(AppColors.primary),
            // thumbColor:
            //     const MaterialStatePropertyAll(AppColors.secondary),
            // overlayColor:
            //     const MaterialStatePropertyAll(AppColors.secondary),
            activeTrackColor: AppColors.secondary,
            activeColor: AppColors.primaryBackground,
            inactiveTrackColor: AppColors.primaryBackground,
            inactiveThumbColor: AppColors.tertiary,
          ),
        ],
      ),
    );
  }
}
