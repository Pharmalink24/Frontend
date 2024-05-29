import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../access/auth/logic/cubit/auth_cubit.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  // Logout confirmation dialog
  void _logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context).translate('signOut'),
          style: AppTextStyle.headlineSmall(context),
        ),
        content: Text(
          AppLocalizations.of(context).translate('confirmSignOut'),
          style: AppTextStyle.bodyLarge(context).copyWith(fontSize: 20.0),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => context.maybePop(),
                child: Text(
                  AppLocalizations.of(context).translate('cancel'),
                  style: AppTextStyle.titleSmall(context),
                ),
              ),
              TextButton(
                onPressed: () async {
                  // Close dialog
                  context.maybePop();

                  // Log out
                  BlocProvider.of<AuthCubit>(context).logout();

                  // Add pushReplacementNamed
                  context.pushRoute(const SignRoute());
                },
                child: Text(
                  AppLocalizations.of(context).translate('signOut'),
                  style: AppTextStyle.titleSmall(context),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormButton(
      onPressed: () {
        // Popup confirmation dialog
        _logoutDialog(context);
      },
      text: AppLocalizations.of(context).translate('signOut'),
      width: null,
      height: null,
    );
  }
}
