// Flutter Packages
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/features/main/prescription/data/models/prescription_doctor.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/features/main/prescription/data/models/prescription_drugs.dart';

import '../../../../../core/theme/gradient.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/loading/loading_indicator.dart';
import '../../../../../resources/resources.dart';

class DoctorPrescriptionCard extends StatelessWidget {
  final PrescriptionDoctor doctor;
  final PrescriptionDrugs drugs;
  final DrugState state;

  const DoctorPrescriptionCard({
    super.key,
    required this.doctor,
    required this.drugs,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: GestureDetector(
        onTap: () => context.pushNamed(
          Routes.prescriptionScreen,
          argument: {
            'id': doctor.id,
            'doctor': doctor.doctorInfo,
            'drugs': drugs,
            'state': state,
          },
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
                padding: const EdgeInsetsDirectional.fromSTEB(10, 16, 0, 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    width: 90,
                    imageUrl:
                        "${ApiConstants.httpsDomain}${doctor.doctorInfo.image}",
                    fit: BoxFit.scaleDown,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        Image.asset(Placeholders.doctorPlaceholder),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            LoadingIndicator(loadingProgress: downloadProgress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. ${doctor.doctorInfo.firstName} ${doctor.doctorInfo.lastName}',
                      style: AppTextStyle.titleMedium(context).copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Text(
                        doctor.date,
                        style: AppTextStyle.titleSmall(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
