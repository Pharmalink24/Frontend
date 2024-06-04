import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/loading/loading_overlay.dart';
import 'package:pharmalink/features/main/settings/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'package:pharmalink/features/main/settings/edit_profile/logic/cubit/edit_profile_state.dart';

class ChangeImageListener extends StatelessWidget {
  ChangeImageListener({super.key});

  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  // Show loading indicator dialog
  void _showLoading(BuildContext context) {
    _loadingOverlay.show(context);
  }

  void _showSuccess(BuildContext context) {
    _loadingOverlay.hide();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Success',
            style: AppTextStyle.headlineLarge(context),
          ),
          content: Text('Image uploaded successfully',
              style: AppTextStyle.bodyMedium(context)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context.maybePop();
                // Todo: Add pushReplacementNamed
                context.pushRoute(
                    const MainRoute()); // Todo: Refresh the page after uploading the image successfully
              },
              child: Text(
                'Ok',
                style: AppTextStyle.labelLarge(context),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showError(BuildContext context) {
    _loadingOverlay.hide();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to upload image'),
          actions: <Widget>[
            TextButton(
              onPressed: () => context.maybePop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
        listenWhen: (previous, current) =>
            current is UploadProfileImageLoading ||
            current is UploadProfileImageSuccess ||
            current is UploadProfileImageError,
        listener: (context, state) {
          if (state is UploadProfileImageSuccess) {
            _showSuccess(context);
          } else if (state is UploadProfileImageError) {
            _showError(context);
          } else if (state is UploadProfileImageLoading) {
            _showLoading(context);
          }
        },
        child: const SizedBox.shrink());
  }
}
