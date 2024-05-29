// ignore_for_file: constant_identifier_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../../core/theme/shadow.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/clip_shadow_path.dart';

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
    if (backgroundColor == context.colorScheme.primary) {
      return context.colorScheme.onPrimary;
    } else if (backgroundColor == context.colorScheme.secondary) {
      return context.colorScheme.primaryContainer;
    } else {
      return context.colorScheme.onBackground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
      child: GestureDetector(
        onTap: () => context.pushRoute(
          PrescriptionsRoute(state: category),
        ),
        child: ClipShadowPath(
          shadow: AppShadows.shadow(context),
          clipper: const ShapeBorderClipper(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(80),
              ),
            ),
          ),
          child: Container(
            color: backgroundColor,
            child: Column(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Text(
                      title,
                      style: AppTextStyle.displayMedium(context).copyWith(
                        fontSize: 42,
                        color: checkFontColor(context, backgroundColor),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(32, 0, 16, 20),
                    child: Text(
                      description,
                      style: AppTextStyle.displayMedium(context).copyWith(
                        fontSize: 24,
                        color: checkFontColor(context, backgroundColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
