import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmalink/core/models/drug_info.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pharmalink/core/networking/networking.dart';

class DrugCard extends StatelessWidget {
  final String tradeName;
  final DrugInfo drugInfo;

  const DrugCard({
    super.key,
    required this.tradeName,
    required this.drugInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                  child: Icon(
                    FontAwesomeIcons.capsules,
                    size: 50,
                    color: AppColors.primary,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(13, 0, 4, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tradeName, style: AppTextStyle.titleLarge
                            //     .override(
                            //   fontFamily:
                            //   'Outfit',
                            //   letterSpacing: 0,
                            // ),
                            ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: const TextSpan(children: [
                              TextSpan(
                                text: '1 g',
                                style: TextStyle(),
                              )
                            ], style: AppTextStyle.labelSmall),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 8, 12),
            child: AutoSizeText('Course: 2 weeks\nDose: 2 tablet/day',
                textAlign: TextAlign.start, style: AppTextStyle.labelMedium),
          ),
        ],
      ),
    );
  }
}
