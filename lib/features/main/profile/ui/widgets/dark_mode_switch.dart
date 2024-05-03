import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Blocs/theme/theme_cubit.dart';
import '../../../../../core/shared_preferences/settings_prefs.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/localization/app_localizations.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({super.key});

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
            value: SettingsSharedPrefs.getTheme() == 1,
            onChanged: (value) => _onChanged(context, value),
            trackOutlineColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.primary,
            ),
            thumbColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.primary,
            ),
            activeTrackColor: Theme.of(context).colorScheme.primaryContainer,
            activeColor: Theme.of(context).colorScheme.primaryContainer,
            inactiveTrackColor: Theme.of(context).colorScheme.primaryContainer,
            inactiveThumbColor: Theme.of(context).colorScheme.tertiary,
          ),
        ],
      ),
    );
  }

  void _onChanged(BuildContext context, bool value) {
    value
        ? context.read<ThemeCubit>().toggleDarkTheme()
        : context.read<ThemeCubit>().toggleLightTheme();
  }
}
