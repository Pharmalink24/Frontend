import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/constants/paths.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:pharmalink/core/routes/routes.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';
import '../theme/styles.dart';
import '../models/doctor.dart';

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
    this.innerPadding = const EdgeInsetsDirectional.only(start: 8, end: 5),
  });

  String cropperName(String name, {int length = 5}) {
    return name.length > length ? '${name.substring(0, length - 1)}..' : name;
  }

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
            padding: innerPadding,
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
                      'Dr. ${cropperName(doctor.firstName, length: 8)}\n${cropperName(doctor.lastName, length: 8)}',
                      textAlign: TextAlign.start,
                    style: AppTextStyle.titleMedium(context).copyWith(
                      fontSize: titleFontSize,
                    ),
                    ),
                    Text(
                      cropperName(doctor.specialty, length: 14),
                      style: AppTextStyle.bodyMedium(context).copyWith(
                      fontSize: subTitleFontSize,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(1, 1),
                  child: Image.network(
                    doctor.image != null
                        ? "${ApiConstants.baseUrl}${doctor.image}"
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
