import "package:flutter/material.dart";
import 'package:pharmalink/core/helpers/classes/field_item.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class FormDropDownButton extends StatelessWidget {
  final String? hintText;
  final String? value;
  final List<DropDownFieldItem> items;
  final Function onChanged;
  final BoxDecoration decoration;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;

  const FormDropDownButton({
    super.key,
    this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.decoration,
    this.padding,
    this.controller,
  });

  List<DropdownMenuItem<String>> buildItemsWidget(
      BuildContext context, List<DropDownFieldItem> items) {
    return items
        .map(
          (entry) => DropdownMenuItem(
            value: entry.key,
            child: Text(
              AppLocalizations.of(context).isEnLocale
                  ? entry.value
                  : entry.valueInArabic ?? entry.value,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    controller?.text = value ?? items.elementAt(0).key;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: Container(
        decoration: decoration,
        width: double.infinity,
        child: DropdownButton(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: context.colorScheme.secondary,
            size: 24,
          ),
          hint: Text(hintText ?? ""),
          padding: padding,
          value: value ?? items.elementAt(0).key,
          onChanged: (value) {
            controller?.text = value!;
            onChanged(value);
          },
          //
          items: buildItemsWidget(context, items),
          style: AppTextStyle.bodyMedium(context),
          underline: const SizedBox(),
          elevation: 5,
          isExpanded: true,
        ),
      ),
    );
  }
}
