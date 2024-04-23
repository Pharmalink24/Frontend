import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/errors.dart';
import 'package:pharmalink/core/models/user.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/features/main/settings/edit_profile/data/repo/edit_profile_repo.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepo _profileRepo;
  EditProfileCubit(this._profileRepo) : super(const EditProfileState.initial());

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Get user profile
  void retrieveUserInformation() async {
    emit(const EditProfileState.retrieveUserInformationLoading());

    final response = await _profileRepo.getUserInformation();
    response.when(
      success: (user) {
        emit(EditProfileState.userInformationRetrieved(user));
      },
      failure: (error) {
        emit(
          EditProfileState.userInformationRetrievedError(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }

  // Edit user profile
  void editUserInformation() async {
    emit(const EditProfileState.editUserInformationLoading());

    final response = await _profileRepo.editProfile(
      User(
        fname: fnameController.text,
        lname: lnameController.text,
        username: usernameController.text,
        email: AuthSharedPrefs.getEmail(),
        phone: phoneController.text,
        birthdate: birthdateController.text,
        gender: genderController.text,
      ),
    );
    response.when(
      success: (user) {
        emit(EditProfileState.userInformationEdited(user));
      },
      failure: (error) {
        emit(
          EditProfileState.userInformationEditedError(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }
}
