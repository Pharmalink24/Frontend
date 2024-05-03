import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';

class AboutContainer extends StatelessWidget {
  final String? university;
  final String? degree;
  final String? brief;

  const AboutContainer({
    super.key,
    this.university,
    this.degree,
    this.brief,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 24.0,
        end: 24.0,
        top: 0.0,
        bottom: 16.0,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(
                0,
                2,
              ),
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: Text(
                    AppLocalizations.of(context).translate('about'),
                    style: AppTextStyle.bodyLarge(context).copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Text(
                  degree ?? AppLocalizations.of(context).translate('no_info'),
                  style: AppTextStyle.bodyMedium(context),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Text(
                  'M.D. ${university ?? AppLocalizations.of(context).translate('no_info')}',
                  style: AppTextStyle.bodyMedium(context),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                  child: Text(
                    brief ?? AppLocalizations.of(context).translate('no_info'),
                    style: AppTextStyle.labelMedium(context),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                child: GestureDetector(
                  onTap: () {
                    // Open the chat screen
                    // TODO: Implement the chat screen
                    context.pushNamed(Routes.doctorScreen);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.accent4],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  12,
                                  0,
                                  12,
                                ),
                                child: Icon(
                                  FontAwesomeIcons.whatsapp,
                                  color: AppColors.secondaryBackground,
                                  size: 24,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  8,
                                  0,
                                  12,
                                  0,
                                ),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate('chat'),
                                  style:
                                      AppTextStyle.bodyMedium(context).copyWith(
                                    color: AppColors.secondaryBackground,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
