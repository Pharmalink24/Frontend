// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/core/helpers/constants/paths.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/models/prescription1.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class DoctorPrescriptionCard extends StatelessWidget {
  final Prescription1 prescription;
  final DrugState state;

  const DoctorPrescriptionCard({
    super.key,
    required this.prescription,
    required this.state,
  });

  Center getLoadingIndicator(
      BuildContext context, ImageChunkEvent loadingProgress) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.secondary,
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: GestureDetector(
        onTap: () => context.pushNamed(
          Routes.prescriptionScreen,
          argument: {
            'id': prescription.id,
            'doctor': prescription.doctorInfo,
            'state': state,
          },
        ),
        child: Container(
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                AppColors.accent4,
              ],
              stops: const [0, 1],
              begin: const AlignmentDirectional(1, 1),
              end: const AlignmentDirectional(-1, -1),
            ),
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
                    prescription.doctorInfo.image != null
                        ? "${ApiConstants.baseUrl}${prescription.doctorInfo.image}"
                        : '${AppPaths.images}/doctor_placeholder.png',
                    width: 89,
                    fit: BoxFit.scaleDown,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return getLoadingIndicator(context, loadingProgress);
                    },
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        '${AppPaths.images}/doctor_placeholder.png',
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
                      'Dr. ${prescription.doctorInfo.firstName} ${prescription.doctorInfo.lastName}',
                      style: AppTextStyle.titleMedium(context).copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Text(
                        prescription.date,
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
