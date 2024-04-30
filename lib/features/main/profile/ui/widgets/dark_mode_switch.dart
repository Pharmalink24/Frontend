import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/Blocs/theme/theme_cubit.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();
  }

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
            AppLocalizations.of(context).translate('switchToDarkMode'),
            style: AppTextStyle.bodyMedium(context),
          ),
          Switch(
            value: _isDarkTheme,
            onChanged: (value) => _onChanged(value),
            trackOutlineColor:
                const MaterialStatePropertyAll(AppColors.tertiary),
            thumbColor: const MaterialStatePropertyAll(AppColors.primary),
            activeTrackColor: AppColors.secondary,
            activeColor: AppColors.primaryBackground,
            inactiveTrackColor: AppColors.primaryBackground,
            inactiveThumbColor: AppColors.tertiary,
          ),
        ],
      ),
    );
  }

  void _onChanged(bool value) {
    setState(() {
      _isDarkTheme = value;

      // Change the theme based on the switch value
      value
          ? context.read<ThemeCubit>().toggleDarkTheme()
          : context.read<ThemeCubit>().toggleLightTheme();
    });
  }
}
