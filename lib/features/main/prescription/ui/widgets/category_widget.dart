// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import '../../../../../core/theme/styles.dart';

class PrescriptionCategoryWidget extends StatelessWidget {
  final String title;
  final String description;
  final Color backgroundColor;
  final DrugState category;

  const PrescriptionCategoryWidget({
    super.key,
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.category,
  });

  /// this function checks that color difference between background color and
  /// text color and returns different color for text
  Color checkFontColor(BuildContext context, Color backgroundColor) {
    return (backgroundColor == Theme.of(context).colorScheme.secondary)
        ? Theme.of(context).colorScheme.onTertiary
        : Theme.of(context).colorScheme.onPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
      child: GestureDetector(
        onTap: () =>
            context.pushNamed(Routes.prescriptionsScreen, argument: category),
        child: Card(
          color: backgroundColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Text(
                    title,
                    style: AppTextStyle.displayMedium(context).copyWith(
                      fontSize: 45,
                      color: checkFontColor(context, backgroundColor),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 20),
                  child: Text(
                    description,
                    style: AppTextStyle.displayMedium(context).copyWith(
                      fontSize: 20,
                      color: checkFontColor(context, backgroundColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
