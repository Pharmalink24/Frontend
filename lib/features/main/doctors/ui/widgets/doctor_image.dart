import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart'; // Todo: Remove this line
import 'package:pharmalink/resources/resources.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/widgets/loading/loading_indicator.dart';

class DoctorImage extends StatelessWidget {
  final String? image;
  const DoctorImage({
    super.key,
    this.image,
  });

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
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                AppColors.accent4,
              ],
              stops: const [0, 1],
              begin: const AlignmentDirectional(0, -1),
              end: const AlignmentDirectional(0, 1),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Align(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                image != null
                    ? "${ApiConstants.baseUrl}$image"
                    : Placeholders.doctorPlaceholder,
                width: double.infinity,
                height: double.infinity,
                // fit: BoxFit.scaleDown,
                fit: BoxFit.contain,

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
                    Placeholders.doctorPlaceholder,
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
