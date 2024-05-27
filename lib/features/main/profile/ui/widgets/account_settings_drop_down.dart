// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/Blocs/locale/locale_cubit.dart';
import 'package:pharmalink/core/enums/language.dart';
import 'package:pharmalink/core/helpers/classes/field_item.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/widgets/form/form_drop_down_button.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';

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
          color: context.colorScheme.primaryContainer,
        ),
        hintText: AppLocalizations.of(context).translate('language'),
        value: AppLocalizations.of(context).isEnLocale
            ? Language.english.key
            : Language.arabic.key,
        items: [
          DropDownFieldItem(
            key: Language.english.key,
            value: Language.english.value,
            valueInArabic: Language.english.valueInArabic,
          ),
          DropDownFieldItem(
            key: Language.arabic.key,
            value: Language.arabic.value,
            valueInArabic: Language.arabic.valueInArabic,
          ),
        ],
        onChanged: (value) => changeLanguage(value),
      ),
    );
  }

  void changeLanguage(String value) {
    setState(() {
      if (value == Language.english.key) {
        BlocProvider.of<LocaleCubit>(context).toEnglish();
      } else if (value == Language.arabic.key) {
        BlocProvider.of<LocaleCubit>(context).toArabic();
      }
    });
  }
}
