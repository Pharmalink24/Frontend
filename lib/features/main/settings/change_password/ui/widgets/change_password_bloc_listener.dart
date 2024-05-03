import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/extensions.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/styles.dart';
import '../../../../../../core/widgets/loading_overlay.dart';
import '../../data/models/change_password_response.dart';
import '../../logic/cubit/change_password_cubit.dart';
import '../../logic/cubit/change_password_state.dart';

class ChangePasswordBlocListener extends StatelessWidget {
  ChangePasswordBlocListener({super.key});
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  // Show loading indicator dialog
  void showLoading(BuildContext context) {
    _loadingOverlay.show(context);
  }

  // Show error indicator dialog
  void showError(BuildContext context, String error) {
    _loadingOverlay.hide();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: AppTextStyle.titleLarge(context),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              AppLocalizations.of(context).translate('gotIt'),
              style: AppTextStyle.labelLarge(context).copyWith(
                color: AppColors.alternateText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Show success indicator dialog
  void showSuccess(
      BuildContext context, ChangePasswordResponse changePasswordResponse) {
    _loadingOverlay.hide();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 32,
        ),
        content: Text(
          changePasswordResponse.message ?? "Password changed successfully",
          style: AppTextStyle.titleLarge(context),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pushReplacementNamed(Routes.mainScreen),
            child: Text(
              AppLocalizations.of(context).translate('gotIt'),
              style: AppTextStyle.labelLarge(context).copyWith(
                color: AppColors.alternateText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showLoading(context),
          success: (changePasswordResponse) =>
              showSuccess(context, changePasswordResponse),
          error: (error) => showError(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
