// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/core/helpers/constants/paths.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/features/main/prescription/data/models/prescription_doctor.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/features/main/prescription/data/models/prescription_drugs.dart';

import '../../../../../core/theme/gradient.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/loading/loading_indicator.dart';

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
                  child: Image.network(
                    doctor.doctorInfo.image != null
                        ? "${ApiConstants.baseUrl}${doctor.doctorInfo.image}"
                        : '${AppPaths.placeholder}/doctor_placeholder.png',
                    width: 89,
                    fit: BoxFit.scaleDown,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;

                      return LoadingIndicator(
                        loadingProgress: loadingProgress,
                      );
                    },
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        '${AppPaths.placeholder}/doctor_placeholder.png',
                      );
                    },
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
