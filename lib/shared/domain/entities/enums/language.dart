enum Language { english, arabic }

// Extension method to convert the enum to a string
extension LanguageExtension on Language {
  String get value {
    switch (this) {
      case Language.english:
        return "English";
      case Language.arabic:
        return "Arabic";
    }
  }

  String get key {
    switch (this) {
      case Language.english:
        return "en";
      case Language.arabic:
        return "ar";
    }
  }

  String get valueInArabic {
    switch (this) {
      case Language.english:
        return "الإنجليزية";
      case Language.arabic:
        return "العربية";
    }
  }
}
