import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;
  const AppShimmer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primary,
      highlightColor: AppColors.accent4,
      enabled: true,
      child: child,
    );
  }
}
