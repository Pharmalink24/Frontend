// Flutter Packages
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/shadow.dart';
import 'package:pharmalink/core/widgets/clip_shadow_path.dart';
import 'package:pharmalink/features/main/prescription/data/models/prescription_doctor.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:pharmalink/features/main/prescription/data/models/prescription_info.dart';
import '../../../../../core/theme/gradient.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/loading/loading_indicator.dart';
import '../../../../../resources/resources.dart';

class DoctorPrescriptionCard extends StatelessWidget {
  final PrescriptionDoctor doctor;
  final PrescriptionInfo prescriptionInfo;
  final DrugState state;

  const DoctorPrescriptionCard({
    super.key,
    required this.doctor,
    required this.prescriptionInfo,
    required this.state,
  });

  Widget _buildImage(BuildContext context) {
    return ClipPath(
      clipper: ShapeBorderClipper(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
      ),
      child: CachedNetworkImage(
        width: 90,
        imageUrl: "${ApiConstants.httpsDomain}${doctor.doctorInfo.image}",
        fit: BoxFit.scaleDown,
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
          width: 90,
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dr. ${doctor.doctorInfo.firstName} ${doctor.doctorInfo.lastName}'
              .crop(16),
          style: AppTextStyle.titleMedium(context).copyWith(
            fontSize: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
          child: Text(
            doctor.date,
            style: AppTextStyle.titleSmall(context),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: GestureDetector(
        onTap: () => context.pushRoute(
          PrescriptionRoute(
            id: doctor.id,
            doctor: doctor.doctorInfo,
            prescriptionInfo: prescriptionInfo,
            drugState: state,
          ),
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
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              gradient: AppGradients.main(context),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: const AlignmentDirectional(0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 16, 0, 16),
                    child: _buildImage(context)),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  child: _buildInfo(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
