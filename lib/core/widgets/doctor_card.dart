import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/gradient.dart';
import 'package:pharmalink/core/theme/shadow.dart';
import '../../resources/resources.dart';
import '../helpers/extensions.dart';
import '../networking/api_constants.dart';
import '../routes/routes.dart';
import '../theme/styles.dart';
import '../../features/main/doctors/data/models/doctor.dart';
import 'loading/loading_indicator.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final double? width;
  final double? height;
  final double titleFontSize;
  final double subTitleFontSize;
  final EdgeInsetsDirectional outerPadding;
  final EdgeInsetsDirectional innerPadding;

  const DoctorCard(
    this.doctor, {
    super.key,
    this.width,
    this.height,
    this.titleFontSize = 16.0,
    this.subTitleFontSize = 11.0,
    this.outerPadding = const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
    this.innerPadding = const EdgeInsetsDirectional.only(start: 8, end: 0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: GestureDetector(
        onTap: () =>
            context.pushNamed(Routes.doctorScreen, argument: doctor.id),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            boxShadow: AppShadows.box(context),
            gradient: AppGradients.main(context),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: innerPadding,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. ${doctor.firstName.crop(8)}\n${doctor.lastName.crop(8)}',
                        textAlign: TextAlign.start,
                        style: AppTextStyle.titleMedium(context).copyWith(
                          fontSize: titleFontSize,
                        ),
                      ),
                      Text(
                        doctor.specialty.crop(14),
                        style: AppTextStyle.bodyMedium(context).copyWith(
                          fontSize: subTitleFontSize,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: const AlignmentDirectional(1, 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: "${ApiConstants.httpsDomain}${doctor.image}",
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        progressIndicatorBuilder: (context, url,
                                downloadProgress) =>
                            LoadingIndicator(loadingProgress: downloadProgress),
                        errorWidget: (context, url, error) =>
                            Image.asset(Placeholders.doctorPlaceholder),
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
