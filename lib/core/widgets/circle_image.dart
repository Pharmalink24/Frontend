// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';

class CircleImage extends StatelessWidget {
  final String url;
  const CircleImage({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 0, horizontal: 8),
      child: Container(
        width: 120,
        height: 120,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return getLoadingIndicator(loadingProgress);
          },
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
