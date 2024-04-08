import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/constants/paths.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/styles.dart';

class DoctorContainer extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String specialty;
  final String? url;

  const DoctorContainer({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.specialty,
    required this.url,
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
        height: 125,
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
                    'Dr. ${cropperName(firstName)}',
                    textAlign: TextAlign.start,
                    style: AppTextStyle.titleMedium.copyWith(
                      fontFamily: AppFonts.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    cropperName(lastName, length: 8),
                    textAlign: TextAlign.start,
                    style: AppTextStyle.titleMedium.copyWith(
                      fontFamily: AppFonts.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    cropperName(specialty, length: 14),
                    style: AppTextStyle.bodyMedium.copyWith(
                      fontFamily: AppFonts.secondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(1, 1),
                child: Image.network(
                  url ?? '${AppPaths.images}/doctor_placeholder.png',
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
