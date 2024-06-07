import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';

class LoadingIndicator extends StatelessWidget {
  final DownloadProgress? loadingProgress;
  const LoadingIndicator({super.key, this.loadingProgress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: context.colorScheme.secondary,
        value: loadingProgress?.progress,
      ),
    );
  }
}
