import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../../../core/helpers/extensions/extensions.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../shared/data/data_sources/remote/api/api_constants.dart';
import '../../../../../../core/theme/gradient.dart';
import '../../../../../../core/theme/shadow.dart';
import '../../../../../../core/theme/styles.dart';
import '../../../../../../shared/presentation/widgets/loading/loading_indicator.dart';
import '../../../../../../resources/resources.dart';

class PrescriptionHeaderCard extends StatelessWidget {
  final int? id;
  final String? doctorImage;
  final String doctorFirstName;
  final String doctorLastName;
  final String date;
  final String time;
  final String? nextVisit;
  const PrescriptionHeaderCard({
    super.key,
    this.id,
    this.doctorImage,
    this.doctorFirstName = "",
    this.doctorLastName = "",
    this.date = "",
    this.time = "",
    this.nextVisit,
  });

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        width: 70,
        height: 70,
        imageUrl: "${ApiConstants.httpsDomain}$doctorImage",
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            LoadingIndicator(loadingProgress: downloadProgress),
        errorWidget: (context, url, error) => Image.asset(
          Placeholders.doctorPlaceholder,
          width: 70,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _buildTime(BuildContext context) {
    return Container(
      // width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withAlpha(100),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                FontAwesomeIcons.solidCalendarDays,
                size: 20,
                color: context.colorScheme.scrim,
              ),
              const SizedBox(width: 4.0),
              Text(
                date,
                style: AppTextStyle.labelMedium(context).copyWith(
                  color: context.colorScheme.scrim,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                FontAwesomeIcons.solidClock,
                size: 20,
                color: context.colorScheme.scrim,
              ),
              const SizedBox(width: 4.0),
              Text(
                time,
                style: AppTextStyle.labelMedium(context).copyWith(
                  color: context.colorScheme.scrim,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorInfo(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${AppLocalizations.of(context).translate("dr")} $doctorFirstName $doctorLastName'
                  .crop(18),
              style: AppTextStyle.titleLarge(context).copyWith(
                color: context.colorScheme.scrim,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            _buildTime(context),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        gradient: AppGradients.main(context),
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: AppShadows.box(context),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImage(context),
          _buildDoctorInfo(context),
        ],
      ),
    );
  }
}
