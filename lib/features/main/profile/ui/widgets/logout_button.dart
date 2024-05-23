import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/routes/routes.dart';
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
                onPressed: () => context.pop(),
                child: Text(
                  AppLocalizations.of(context).translate('cancel'),
                  style: AppTextStyle.titleSmall(context),
                ),
              ),
              // Todo: Implement log out with AuthCubit
              TextButton(
                onPressed: () async {
                  // Close dialog
                  context.pop();
                  // Log out
                  context.read<AuthCubit>().logout();
                  context.pushReplacementNamed(Routes.signScreen);
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
