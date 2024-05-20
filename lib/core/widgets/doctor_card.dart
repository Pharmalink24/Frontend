import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/gradient.dart';
import 'package:pharmalink/core/theme/shadow.dart';
import '../helpers/constants/paths.dart';
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
                ),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: const AlignmentDirectional(1, 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        doctor.image != null
                            ? "${ApiConstants.baseUrl}${doctor.image}"
                            : '${AppPaths.placeholder}/doctor_placeholder.png',
                        fit: BoxFit.scaleDown,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return LoadingIndicator(
                              loadingProgress: loadingProgress);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
