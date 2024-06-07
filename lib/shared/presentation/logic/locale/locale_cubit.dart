import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:meta/meta.dart';
import '../../../domain/entities/enums/language.dart';

import '../../../data/data_sources/local/shared_preferences/settings_prefs.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  // Passing an initial value (state) with a default 'Locale' to the super class.
  LocaleCubit()
      : super(SelectedLocale(Locale(SettingsSharedPrefs.getLocale())));

  // Once we call this method, the BlocBuilder<LocaleCubit>
  // in the 'main.dart' will rebuild the entire app with
  // the new emitted state that holds the 'ar' locale.
  void toArabic() {
    emit(SelectedLocale(Locale(Language.arabic.key)));
    SettingsSharedPrefs.storeLocale(Language.arabic);
  }

  // Same as the previous method, but with the 'en' locale.
  void toEnglish() {
    emit(SelectedLocale(Locale(Language.english.key)));
    SettingsSharedPrefs.storeLocale(Language.english);
  }
}
