import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/loading_indicator.dart';
import 'package:pharmalink/features/access/signin/data/models/refresh_token_response.dart';
import 'package:pharmalink/features/access/signin/logic/cubit/signin_cubit.dart';
import 'package:pharmalink/features/access/signin/logic/cubit/signin_state.dart';

class RefreshTokenBlocListener extends StatelessWidget {
  RefreshTokenBlocListener({super.key});
  
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  // Show loading indicator dialog
  void showLoading(BuildContext context) {
    _loadingOverlay.show(context);
  }

  // Show error indicator dialog
  void showError(BuildContext context, String error) {
    // Close loading dialog
    _loadingOverlay.hide();
    // Show error dialog
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
    // Navigate to sign in screen
    context.pushNamed(Routes.signInScreen);
  }

  void showSuccess(
      BuildContext context, RefreshTokenResponse refreshTokenResponse) async {
    // Close loading dialog
    _loadingOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showLoading(context),
          success: (refreshTakenResponse) =>
              showSuccess(context, refreshTakenResponse),
          error: (error) => showError(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
