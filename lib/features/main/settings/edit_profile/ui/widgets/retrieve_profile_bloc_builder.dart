import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';

import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/models/user.dart';
import '../../../../../../core/theme/styles.dart';
import '../../../../../../core/widgets/form/form_view.dart';
import '../../../../../../core/widgets/loading/loading_indicator.dart';
import '../../data/models/edit_profile_fields.dart';
import '../../logic/cubit/edit_profile_cubit.dart';
import '../../logic/cubit/edit_profile_state.dart';

class RetrieveProfileBlocBuilder extends StatelessWidget {
  const RetrieveProfileBlocBuilder({super.key});

  Widget buildFormView(BuildContext context, User user) {
    // Initialize controllers
    editProfileFields["gender"]!.value = user.gender;

    // Initialize controllers
    context.read<EditProfileCubit>().fnameController.text = user.fname!;
    context.read<EditProfileCubit>().lnameController.text = user.lname!;
    context.read<EditProfileCubit>().usernameController.text = user.username!;
    context.read<EditProfileCubit>().phoneController.text = user.phone!;
    context.read<EditProfileCubit>().birthdateController.text = user.birthdate!;
    context.read<EditProfileCubit>().genderController.text = user.gender!;

    // Build form view
    return FormView(
      model: editProfileFields,
      formKey: context.read<EditProfileCubit>().formKey,
      decorationType: DecorationType.secondary,
    );
  }

  Widget buildErrorWidget(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 50,
              color: context.colorScheme.error,
            ),
            const SizedBox(height: 20),
            Text(
              error,
              style: AppTextStyle.bodyMedium(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<EditProfileCubit>().retrieveUserInformation();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.secondary,
              ),
              child: Text(
                AppLocalizations.of(context).translate('retry'),
                style: AppTextStyle.bodySmall(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      buildWhen: (previous, current) =>
          current is RetrieveUserInformationLoading ||
          current is UserInformationRetrieved ||
          current is Error,
      builder: (context, state) {
        if (state is RetrieveUserInformationLoading) {
          return const LoadingIndicator();
        } else if (state is UserInformationRetrieved) {
          final user = state.data;
          return buildFormView(context, user);
        } else if (state is UserInformationRetrievedError) {
          return buildErrorWidget(context, state.error);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
