// Flutter Packages
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../resources/resources.dart';
import 'loading/loading_indicator.dart';

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
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              LoadingIndicator(loadingProgress: downloadProgress),
          errorWidget: (context, url, error) =>
              Image.asset(Placeholders.userPlaceholder),
        ),
      ),
    );
  }
}
