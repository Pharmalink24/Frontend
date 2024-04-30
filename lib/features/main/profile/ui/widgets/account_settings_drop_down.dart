// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/Blocs/cubit/locale_cubit.dart';
import 'package:pharmalink/core/helpers/classes/field_item.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/widgets/form/form_drop_down_button.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';

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

class LanguageDropDown extends StatefulWidget {
  const LanguageDropDown({
    super.key,
  });

  @override
  State<LanguageDropDown> createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
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
        hintText: AppLocalizations.of(context).translate('language'),
        value: AppLocalizations.of(context).isEnLocale
            ? Language.English.key
            : Language.Arabic.key,
        items: [
          DropDownFieldItem(
            key: Language.English.key,
            value: Language.English.value,
            valueInArabic: Language.English.valueInArabic,
          ),
          DropDownFieldItem(
            key: Language.Arabic.key,
            value: Language.Arabic.value,
            valueInArabic: Language.Arabic.valueInArabic,
          ),
        ],
        onChanged: (value) => changeLanguage(value),
      ),
    );
  }

  void changeLanguage(String value) {
    setState(() {
      if (value == Language.English.key) {
        BlocProvider.of<LocaleCubit>(context).toEnglish();
      } else if (value == Language.Arabic.key) {
        BlocProvider.of<LocaleCubit>(context).toArabic();
      }
    });
  }
}
