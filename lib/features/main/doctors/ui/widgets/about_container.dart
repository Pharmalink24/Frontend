import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmalink/core/theme/icons.dart';
import 'package:pharmalink/features/main/chat/data/models/chat.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/gradient.dart';
import '../../../../../core/theme/styles.dart';
import '../../data/models/doctor_info.dart';

class AboutContainer extends StatelessWidget {
  final DoctorInfo? doctor;

  const AboutContainer({
    super.key,
    this.doctor,
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
          color: Theme.of(context).colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Theme.of(context).colorScheme.shadow,
              offset: const Offset(
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
                  doctor?.degree ??
                      AppLocalizations.of(context).translate('no_info'),
                  style: AppTextStyle.bodyMedium(context),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Text(
                  'M.D. ${doctor?.university ?? AppLocalizations.of(context).translate('no_info')}',
                  style: AppTextStyle.bodyMedium(context),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                  child: Text(
                    doctor?.brief ??
                        AppLocalizations.of(context).translate('no_info'),
                    style: AppTextStyle.labelMedium(context),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                child: GestureDetector(
                  onTap: () {
                    // Open the chat screen
                    var chat = Chat(
                      chatWithId: doctor?.id,
                      fname: doctor?.firstName,
                      lname: doctor?.lastName,
                      image: doctor?.image,
                      username: doctor?.username,
                      lastMessage: '',
                      lastMessageDateTime: '',
                    );
                    context.pushNamed(
                      Routes.messagesScreen,
                      argument: chat,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: AppGradients.main(context),
                      borderRadius: BorderRadius.circular(12),
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  12,
                                  0,
                                  12,
                                ),
                                child: Icon(
                                  FFIcons.kLogoPharmaLink,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
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
