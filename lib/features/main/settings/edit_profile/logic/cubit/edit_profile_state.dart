import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState<T> with _$EditProfileState<T> {
  const factory EditProfileState.initial() = _Initial;

  const factory EditProfileState.editUserInformationLoading() = EditUserInformationLoading;
  const factory EditProfileState.retrieveUserInformationLoading() = RetrieveUserInformationLoading;
  const factory EditProfileState.userInformationRetrieved(T data) = UserInformationRetrieved<T>;
  const factory EditProfileState.userInformationEdited(T data) = UserInformationEdited<T>;
  const factory EditProfileState.userInformationRetrievedError({required String error}) = UserInformationRetrievedError;
  const factory EditProfileState.userInformationEditedError({required String error}) = UserInformationEditedError;
}
