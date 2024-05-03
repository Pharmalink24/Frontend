import 'package:flutter/material.dart';
import '../../../../../core/helpers/constants/paths.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/theme/colors.dart';

class DoctorImage extends StatelessWidget {
  final String? image;
  const DoctorImage({
    super.key,
    this.image,
  });

  Center _getLoadingIndicator(ImageChunkEvent loadingProgress) {
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

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 28,
          horizontal: 24,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.accent4],
              stops: [0, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Align(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                image != null
                    ? "${ApiConstants.baseUrl}$image"
                    : '${AppPaths.images}/doctor_placeholder.png',
                width: double.infinity,
                height: double.infinity,
                // fit: BoxFit.scaleDown,
                fit: BoxFit.contain,

                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return _getLoadingIndicator(loadingProgress);
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
        ),
      ),
    );
  }
}
