import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final DownloadProgress? loadingProgress;
  const LoadingIndicator({super.key, this.loadingProgress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.secondary,
        value: loadingProgress?.progress,
      ),
    );
  }
}
