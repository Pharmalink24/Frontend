import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';
import 'package:pharmalink/features/main/settings/edit_profile/data/models/edit_profile_fields.dart';
import 'package:pharmalink/features/main/settings/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'package:pharmalink/generated/l10n.dart';
import 'widgets/edit_profile_bloc_listener.dart';
import 'widgets/retrieve_profile_bloc_builder.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    super.initState();

    // Initialize controllers
    editProfileFields["fname"]!.controller =
        context.read<EditProfileCubit>().fnameController;
    editProfileFields["lname"]!.controller =
        context.read<EditProfileCubit>().lnameController;
    editProfileFields["username"]!.controller =
        context.read<EditProfileCubit>().usernameController;
    editProfileFields["phone"]!.controller =
        context.read<EditProfileCubit>().phoneController;
    editProfileFields["birthdate"]!.controller =
        context.read<EditProfileCubit>().birthdateController;
    editProfileFields['gender']!.controller =
        context.read<EditProfileCubit>().genderController;

    // Get user information
    context.read<EditProfileCubit>().retrieveUserInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.secondaryText,
        ),
        backgroundColor: AppColors.primaryBackground,
        title: Text(
          S.of(context).editProfile,
          style: AppTextStyle.displayMedium.copyWith(
            fontSize: 28,
          ),
        ),
        elevation: 2,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 22.0),
          children: [
            Text(
              S.of(context).editYourProfile,
              style: AppTextStyle.headlineLarge.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
            const RetrieveProfileBlocBuilder(),
            FormButton(
              text: S.of(context).saveChanges,
              onPressed: () => changePassword(context),
              color: AppColors.primary,
              borderRadius: 12.0,
            ),
            EditProfileBlocListener(),
          ],
        ),
      ),
    );
  }

  void changePassword(BuildContext context) {
    if (context.read<EditProfileCubit>().formKey.currentState!.validate()) {
      context.read<EditProfileCubit>().editUserInformation();
    }
  }
}
