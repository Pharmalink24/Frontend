import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/constants/paths.dart';
import 'package:pharmalink/core/networking/api_constants.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/styles.dart';
import '../../data/models/doctor.dart';

class DoctorContainer extends StatelessWidget {
  final Doctor doctor;

  const DoctorContainer(
    this.doctor, {
    super.key,
  });

  String cropperName(String name, {int length = 5}) {
    return name.length > length ? '${name.substring(0, length - 1)}..' : name;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
      child: Container(
        width: 205,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.accent4,
            ],
            stops: [0, 1],
            begin: AlignmentDirectional(1, 1),
            end: AlignmentDirectional(-1, -1),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding:
              const EdgeInsetsDirectional.symmetric(vertical: 0, horizontal: 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. ${cropperName(doctor.firstName, length: 8)}',
                    textAlign: TextAlign.start,
                    style: AppTextStyle.titleMedium.copyWith(
                      fontFamily: AppFonts.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    cropperName(doctor.lastName, length: 8),
                    textAlign: TextAlign.start,
                    style: AppTextStyle.titleMedium.copyWith(
                      fontFamily: AppFonts.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    cropperName(doctor.specialty, length: 14),
                    style: AppTextStyle.bodyMedium.copyWith(
                      fontFamily: AppFonts.secondary,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(1, 1),
                child: Image.network(
                  doctor.image != null
                      ? "${ApiConstants.httpsProtocol}${ApiConstants.domain}${doctor.image}"
                      : '${AppPaths.images}/doctor_placeholder.png',
                  width: 100,
                  fit: BoxFit.scaleDown,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

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
}
