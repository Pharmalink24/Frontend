import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/loading_overlay.dart';
import 'package:pharmalink/features/main/settings/change_password/data/models/change_password_response.dart';
import 'package:pharmalink/features/main/settings/change_password/logic/cubit/change_password_cubit.dart';
import 'package:pharmalink/features/main/settings/change_password/logic/cubit/change_password_state.dart';

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
          style: AppTextStyle.titleLarge,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              "Got it",
              style: AppTextStyle.labelLarge.copyWith(
                color: AppColors.alternateText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Show success indicator dialog
  void showSuccess(BuildContext context, ChangePasswordResponse changePasswordResponse) {
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
          style: AppTextStyle.titleLarge,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pushReplacementNamed(Routes.mainScreen),
            child: Text(
              "Got it",
              style: AppTextStyle.labelLarge.copyWith(
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
          success: (changePasswordResponse) => showSuccess(context, changePasswordResponse),
          error: (error) => showError(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
