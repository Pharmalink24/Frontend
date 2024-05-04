import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/theme/app_bar.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/form/form_button.dart';
import '../data/models/edit_profile_fields.dart';
import '../logic/cubit/edit_profile_cubit.dart';
import '../../../../../core/helpers/mixins.dart';
import 'widgets/edit_profile_bloc_listener.dart';
import 'widgets/retrieve_profile_bloc_builder.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with PostFrameMixin {
  @override
  void initState() {
    super.initState();

    // Get user information
    // postFrame(retrieveUserInformation);
    Future.delayed(Duration.zero, () {
      setControllers();
      retrieveUserInformation();
    });
  }

  void setControllers() {
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
  }

  void retrieveUserInformation() {
    BlocProvider.of<EditProfileCubit>(context).retrieveUserInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        type: AppBarType.withLogoAndTitle,
        title: AppLocalizations.of(context).translate('editProfile'),
      ).build(context),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 22.0),
          children: [
            Text(AppLocalizations.of(context).translate('editYourProfile'),
                style: AppTextStyle.headlineLarge(context)),
            const RetrieveProfileBlocBuilder(),
            FormButton(
              text: AppLocalizations.of(context).translate('saveChanges'),
              onPressed: () => changePassword(context),
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
