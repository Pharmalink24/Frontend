// Flutter Packages
import 'package:flutter/material.dart';

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
        child: Image.network(
          url,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            return LoadingIndicator(
              loadingProgress: loadingProgress,
            );
          },
        ),
      ),
    );
  }
}
