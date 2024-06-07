import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/theme/app_bar.dart';
import '../../../../../../core/theme/styles.dart';
import '../../../../../../shared/presentation/widgets/form/form_button.dart';
import '../../domain/models/models/edit_profile_fields.dart';
import '../logic/edit_profile_cubit.dart';
import '../../../../../../core/helpers/mixins/mixins.dart';
import 'edit_profile_bloc_listener.dart';
import 'retrieve_profile_bloc_builder.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget>
    with PostFrameMixin {
  @override
  void initState() {
    super.initState();

    // Set controllers
    setControllers();
    // Retrieve user information
    context.read<EditProfileCubit>().retrieveUserInformation();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        type: AppBarType.withoutLogo,
        title: AppLocalizations.of(context).translate('editProfile'),
        automaticallyImplyLeading: true,
      ).build(context),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 22.0),
          children: [
            Text(
              AppLocalizations.of(context).translate('editYourProfile'),
              style: AppTextStyle.headlineLarge(context),
            ),
            const SizedBox(height: 16.0),
            const RetrieveProfileBlocBuilder(),
            FormButton(
              text: AppLocalizations.of(context).translate('saveChanges'),
              onPressed: () => changePassword(context),
              borderRadius: 12.0,
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
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
