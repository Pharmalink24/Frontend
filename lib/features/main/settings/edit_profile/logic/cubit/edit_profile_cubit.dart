import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/helpers/constants/errors.dart';
import '../../../../../../shared/domain/entities/models/user.dart';
import '../../../../../../shared/data/data_sources/local/shared_preferences/auth_prefs.dart';
import '../../data/repo/edit_profile_repo.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepo _editProfileRepo;
  EditProfileCubit(this._editProfileRepo)
      : super(const EditProfileState.initial());

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

    final response = await _editProfileRepo.getUserInformation();
    response.when(
      success: (user) {
        emit(EditProfileState.userInformationRetrieved(user));
      },
      failure: (error) {
        emit(
          EditProfileState.userInformationRetrievedError(
            error: error.apiErrorModel.error ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }

  // Edit user profile
  void editUserInformation() async {
    emit(const EditProfileState.editUserInformationLoading());

    final response = await _editProfileRepo.editProfile(
      User(
        fname: fnameController.text,
        lname: lnameController.text,
        username: usernameController.text,
        email: AuthSharedPrefs.getEmail(), // Get the email from the shared preferences
        // Todo: delete the email from the user model
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
            error: error.apiErrorModel.error ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }

  // Edit user profile
  void uploadUserImage() async {
    emit(const EditProfileState.uploadProfileImageLoading());

    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      emit(const EditProfileState.uploadProfileImageError(
          error: ERR.NO_IMAGE_SELECTED));
      return;
    }

    final response = await _editProfileRepo.editProfileImage(
      File(pickedFile.path),
    );
    response.when(
      success: (image) {
        emit(EditProfileState.uploadProfileImageSuccess(image));
      },
      failure: (error) {
        emit(
          EditProfileState.uploadProfileImageError(
            error: error.apiErrorModel.error ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }
}
