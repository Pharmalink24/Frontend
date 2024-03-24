// Flutter Packages
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final Image image;
  const CircleImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 0, horizontal: 8),
      child: Container(
        width: 120,
        height: 120,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: image,
      ),
    );
  }
}
