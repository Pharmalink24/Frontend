import 'package:flutter/material.dart';
import 'package:pharmalink/core/localization/localization.dart';
import 'package:pharmalink/generated/l10n.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/styles.dart';

class SignupTab extends StatelessWidget {
  const SignupTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: isArabic() ? 16.0 : 0.0,
            right: isArabic() ? 0.0 : 16.0,
            bottom: 12.0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              S.of(context).signIn,
              style: AppTextStyle.displaySmall.copyWith(
                color: AppColors.secondaryText,
                fontFamily: AppFonts.tertiary,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: isArabic() ? 0.0 : 16.0,
            right: isArabic() ? 16.0 : 0.0,
            bottom: 12.0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              S.of(context).signUp,
              style: AppTextStyle.displaySmall.copyWith(
                color: AppColors.primaryText,
                fontFamily: AppFonts.tertiary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
