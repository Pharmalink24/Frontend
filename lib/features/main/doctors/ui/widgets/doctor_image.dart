import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/gradient.dart';
import 'package:pharmalink/resources/resources.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/widgets/loading/loading_indicator.dart';
import '../../../../../core/widgets/parallax_container.dart';

class DoctorImage extends StatelessWidget {
  final String? image;
  const DoctorImage({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ParallaxContainer(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            vertical: 28,
            horizontal: 24,
          ),
          child: ClipPath(
            clipper: const ShapeBorderClipper(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(80),
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: AppGradients.main(context),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Align(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: double.infinity,
                    imageUrl: "${ApiConstants.httpsDomain}$image",
                    fit: BoxFit.contain,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            LoadingIndicator(loadingProgress: downloadProgress),
                    errorWidget: (context, url, error) =>
                        Image.asset(Placeholders.doctorPlaceholder),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
