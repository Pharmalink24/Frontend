import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/loading_overlay.dart';
import 'package:pharmalink/features/access/auth/logic/cubit/auth_cubit.dart';
import 'package:pharmalink/features/access/auth/logic/cubit/auth_state.dart';
import 'package:pharmalink/features/access/auth/data/models/refresh_token_response.dart';
import 'package:pharmalink/features/main/main/ui/widgets/pages.dart';

class RefreshTokenBlocListener extends StatefulWidget {
  final int activeIndex;
  const RefreshTokenBlocListener({super.key, required this.activeIndex});

  @override
  State<RefreshTokenBlocListener> createState() =>
      _RefreshTokenBlocListenerState();
}

class _RefreshTokenBlocListenerState extends State<RefreshTokenBlocListener> {
  @override
  void initState() {
    super.initState();
  }

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
          style: AppTextStyle.titleLarge(context),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              "Got it",
              style: AppTextStyle.labelLarge(context).copyWith(
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
    BuildContext context,
    RefreshTokenResponse refreshTokenResponse,
  ) async {
    // Close loading dialog
    _loadingOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
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
      buildWhen: (previous, current) => current is! Loading,
      builder: (context, state) {
        if (state is Success) {
          return Expanded(child: pages[widget.activeIndex]);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
