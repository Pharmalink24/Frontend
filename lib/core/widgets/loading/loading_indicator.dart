import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final ImageChunkEvent? loadingProgress;
  const LoadingIndicator({super.key, this.loadingProgress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.secondary,
        value: loadingProgress != null
            ? loadingProgress!.expectedTotalBytes != null
                ? loadingProgress!.cumulativeBytesLoaded /
                    loadingProgress!.expectedTotalBytes!
                : null
            : 1.0,
      ),
    );
  }
}
