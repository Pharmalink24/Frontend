import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmalink/resources/resources.dart';
import 'dart:convert' show json;
import 'app_localizations_delegate.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale) : _localizedStrings = {};

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('en'));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  Future<void> load() async {
    late String jsonString;

    if (locale.languageCode == 'en') {
      jsonString = await rootBundle.loadString(Languages.en);
    }else{
      jsonString = await rootBundle.loadString(Languages.ar);
    }

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map<String, String>((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) => _localizedStrings[key] ?? key;

  bool get isEnLocale => locale.languageCode == 'en';
}
