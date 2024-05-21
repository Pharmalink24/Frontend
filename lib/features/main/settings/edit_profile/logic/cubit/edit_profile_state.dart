import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState<T> with _$EditProfileState<T> {
  const factory EditProfileState.initial() = _Initial;

  // Edit user information
  const factory EditProfileState.editUserInformationLoading() =
      EditUserInformationLoading;
  const factory EditProfileState.userInformationEdited(T data) =
      UserInformationEdited<T>;
  const factory EditProfileState.userInformationEditedError(
      {required String error}) = UserInformationEditedError;

  // Retrieve user information
  const factory EditProfileState.retrieveUserInformationLoading() =
      RetrieveUserInformationLoading;
  const factory EditProfileState.userInformationRetrieved(T data) =
      UserInformationRetrieved<T>;
  const factory EditProfileState.userInformationRetrievedError(
      {required String error}) = UserInformationRetrievedError;

  // Edit user profile image
  const factory EditProfileState.uploadProfileImageLoading() =
      UploadProfileImageLoading;
  const factory EditProfileState.uploadProfileImageSuccess(T data) =
      UploadProfileImageSuccess<T>;
  const factory EditProfileState.uploadProfileImageError(
      {required String error}) = UploadProfileImageError;
}
