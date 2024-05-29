import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/localization/app_localizations.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: GestureDetector(
          onTap: () => context.pushRoute(const ForgetPasswordRoute()),
          child: Text(
            AppLocalizations.of(context).translate('forgetPassword'),
            style: AppTextStyle.labelMedium(context).copyWith(
              color: context.colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
