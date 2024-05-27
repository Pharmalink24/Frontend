// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import '../../../../../core/theme/shadow.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/clip_shadow_path.dart';

class PrescriptionCategoryWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String description;
  final Color backgroundColor;
  final DrugState category;

  const PrescriptionCategoryWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.category,
  });

  /// this function checks that color difference between background color and
  /// text color and returns different color for text
  Color checkFontColor(BuildContext context, Color backgroundColor) {
    if (backgroundColor == Theme.of(context).colorScheme.primary) {
      return Theme.of(context).colorScheme.onPrimary;
    } else if (backgroundColor == Theme.of(context).colorScheme.secondary) {
      return Theme.of(context).colorScheme.primaryContainer;
    } else {
      return Theme.of(context).colorScheme.onBackground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
      child: GestureDetector(
        onTap: () =>
            context.pushNamed(Routes.prescriptionsScreen, argument: category),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          iconData,
                          color: checkFontColor(context, backgroundColor),
                          size: 50,
                        ),
                        Text(
                          title,
                          style: AppTextStyle.displayMedium(context).copyWith(
                            fontSize: 32,
                            color: checkFontColor(context, backgroundColor),
                          ),
                        ),
                      ],
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
                        fontSize: 18,
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
