import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../shared/domain/entities/models/user.dart';
import '../../../../../../core/theme/styles.dart';
import '../../../../../../shared/presentation/widgets/loading/loading_overlay.dart';
import '../logic/edit_profile_cubit.dart';
import '../logic/edit_profile_state.dart';

class EditProfileBlocListener extends StatelessWidget {
  EditProfileBlocListener({super.key});
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
        icon: Icon(
          Icons.error,
          color: context.colorScheme.error,
          size: 32,
        ),
        content: Text(
          error,
          style: AppTextStyle.titleLarge(context),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => context.maybePop(),
            child: Text(
              AppLocalizations.of(context).translate('gotIt'),
              style: AppTextStyle.labelLarge(context).copyWith(
                color: context.colorScheme.onTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Show success indicator dialog
  void showSuccess(BuildContext context, User user) {
    _loadingOverlay.hide();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.check_circle,
          color: context.colorScheme.primary,
          size: 32,
        ),
        content: Text(
          AppLocalizations.of(context)
              .translate('informationChangedSuccessfully'),
          style: AppTextStyle.titleLarge(context),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            // Todo: Add push replacement
            onPressed: () => context.pushRoute(const MainRoute()),
            child: Text(
              AppLocalizations.of(context).translate('gotIt'),
              style: AppTextStyle.labelLarge(context).copyWith(
                color: context.colorScheme.onTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listenWhen: (previous, current) =>
          current is EditUserInformationLoading ||
          current is UserInformationEdited ||
          current is Error,
      listener: (context, state) {
        state.whenOrNull(
          editUserInformationLoading: () => showLoading(context),
          userInformationEdited: (user) => showSuccess(context, user),
          userInformationEditedError: (error) => showError(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
