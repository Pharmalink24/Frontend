import 'package:flutter/material.dart';
import '../../../../../core/helpers/constants/paths.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/card_container.dart';

class PrescriptionHeaderCard extends StatelessWidget {
  final int? id;
  final String? doctorImage;
  final String doctorFirstName;
  final String doctorLastName;
  final String date;
  final String time;
  const PrescriptionHeaderCard({
    super.key,
    this.id,
    this.doctorImage,
    this.doctorFirstName = "",
    this.doctorLastName = "",
    this.date = "",
    this.time = "",
  });

  Center getLoadingIndicator(ImageChunkEvent loadingProgress) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.secondary,
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardContainer(
        onPressed: () => context.pushNamed(Routes.doctorScreen, argument: id),
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                doctorImage != null
                    ? "${ApiConstants.baseUrl}$doctorImage"
                    : '${AppPaths.images}/doctor_placeholder.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return getLoadingIndicator(loadingProgress);
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    '${AppPaths.images}/doctor_placeholder.png',
                  );
                },
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Text(
                          '${AppLocalizations.of(context).translate("dr")} $doctorFirstName $doctorLastName',
                          style: AppTextStyle.titleLarge(context),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                        child: Text(
                          "$date - $time",
                          style: AppTextStyle.labelMedium(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
