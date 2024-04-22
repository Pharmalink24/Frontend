// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/widgets/form/form_drop_down_button.dart';

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
}

class LanguageDropDown extends StatefulWidget {
  const LanguageDropDown({
    super.key,
  });

  @override
  State<LanguageDropDown> createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
  Language _language = Language.English;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: FormDropDownButton(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.primaryBackground,
        ),
        hintText: "Language",
        value: _language.key,
        items: {
          Language.English.key: Language.English.value,
          Language.Arabic.key: Language.Arabic.value,
        },
        onChanged: (value) {
          setState(() {
            if (value == Language.English.key) {
              _language = Language.English;
            } else if (value == Language.Arabic.key) {
              _language = Language.Arabic;
            }
          });
        },
      ),
    );
  }
}
