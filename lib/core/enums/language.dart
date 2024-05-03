enum Language { English, Arabic }

// Extension method to convert the enum to a string
extension LanguageExtension on Language {
  String get value {
    switch (this) {
      case Language.English:
        return "English";
      case Language.Arabic:
        return "Arabic";
    }
  }

  String get key {
    switch (this) {
      case Language.English:
        return "en";
      case Language.Arabic:
        return "ar";
    }
  }

  String get valueInArabic {
    switch (this) {
      case Language.English:
        return "الإنجليزية";
      case Language.Arabic:
        return "العربية";
    }
  }
}

