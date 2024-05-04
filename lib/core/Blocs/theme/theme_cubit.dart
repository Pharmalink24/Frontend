import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared_preferences/settings_prefs.dart';
import '../../theme/app_theme.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(SettingsSharedPrefs.getTheme() == 1
            ? ThemeState.dark(AppTheme.darkTheme())
            : ThemeState.light(AppTheme.lightTheme()));

  // Switch to the dark theme
  void toggleDarkTheme() {
    // Initialize the theme data with the dark theme
    emit(ThemeState.dark(AppTheme.darkTheme()));

    // Store the theme in the shared preferences
    SettingsSharedPrefs.storeTheme(1);
  }

  // Switch to the light theme
  void toggleLightTheme() {
    // Initialize the theme data with the light theme
    emit(ThemeState.light(AppTheme.lightTheme()));

    // Store the theme in the shared preferences
    SettingsSharedPrefs.storeTheme(0);
  }
}
