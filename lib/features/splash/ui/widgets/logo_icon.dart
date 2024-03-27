import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/constants/paths.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';

const kLogoSize = 150.0;

class LogoIcon extends StatelessWidget {
  const LogoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageIcon(
          AssetImage("${AppPaths.images}/logo.png"),
          size: kLogoSize,
          color: AppColors.primary,
        ),
        Text(
          "PharmaLink",
          textAlign: TextAlign.center,
          style: AppTextStyle.displayMedium.copyWith(
            color: AppColors.secondary,
            fontFamily: AppFonts.primary,
          ),
        ),
      ],
    );
  }
}
