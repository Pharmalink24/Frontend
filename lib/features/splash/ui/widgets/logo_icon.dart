import 'package:flutter/material.dart';
import 'package:pharmalink/generated/l10n.dart';
import '../../../../core/helpers/constants/paths.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/theme/styles.dart';

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
          S.of(context).appName,
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
