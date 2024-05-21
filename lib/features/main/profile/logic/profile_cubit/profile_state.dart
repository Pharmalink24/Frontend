import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _Initial;
  
  // Get user profile information
  const factory ProfileState.profileInformationLoading() =
      ProfileInformationLoading;
  const factory ProfileState.profileInformationSuccess(T data) =
      ProfileInformationSuccess<T>;
  const factory ProfileState.profileInformationError({required String error}) =
      ProfileInformationError;
}