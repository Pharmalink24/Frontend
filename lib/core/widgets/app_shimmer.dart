import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../localization/app_localizations.dart';
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
      direction: AppLocalizations.of(context).isEnLocale
          ? ShimmerDirection.ltr
          : ShimmerDirection.rtl,
      baseColor: context.colorScheme.secondary.withOpacity(0.1),
      highlightColor: context.colorScheme.secondary.withOpacity(0.2),
      enabled: true,
      child: child,
    );
  }

  static Widget circle(
    BuildContext context, {
    double width = 0.0,
    double height = 0.0,
  }) {
    return AppShimmer(
      child: ClipRRect(
        
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  static Widget rectangle(BuildContext context, {
    double width = 0.0,
    double height = 0.0,
  }){
    return AppShimmer(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
