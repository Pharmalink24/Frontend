import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/models/profile_image.dart';
import 'package:pharmalink/features/main/settings/edit_profile/data/repo/edit_profile_repo.dart';
import '../../../../../core/helpers/errors.dart';
import '../../data/repo/profile_repo.dart';
import 'profile_state.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  final EditProfileRepo _editProfileRepo;
  ProfileCubit(this._profileRepo, this._editProfileRepo)
      : super(const ProfileState.initial());

  // Edit user profile
  void uploadUserImage() async {
    emit(const ProfileState.uploadProfileImageLoading());

    File file;

    final picker = ImagePicker();

    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    Logger().i(pickedFile);

    if (pickedFile == null) {
      emit(const ProfileState.uploadProfileImageError(
          error: ERR.NO_IMAGE_SELECTED));
      return;
    }

    file = File(pickedFile.path);

    String fileName = file.path.split("/").last;

    MultipartFile data =
        await MultipartFile.fromFile(file.path, filename: fileName);

    final response = await _editProfileRepo.editProfileImage(
      ProfileImage(
        data: data,
      ),
    );
    response.when(
      success: (image) {
        emit(ProfileState.uploadProfileImageSuccess(image));
      },
      failure: (error) {
        emit(
          ProfileState.uploadProfileImageError(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }

  // Get user profile
  void getUserProfile() async {
    emit(const ProfileState.profileInformationLoading());

    final response = await _profileRepo.getUserInformation();
    response.when(
      success: (user) {
        emit(ProfileState.profileInformationSuccess(user));
      },
      failure: (error) {
        emit(ProfileState.profileInformationError(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED));
      },
    );
  }
}
