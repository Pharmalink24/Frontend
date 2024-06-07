import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/constants/errors.dart';
import '../../data/repo/profile_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

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
            error: error.apiErrorModel.error ?? ERR.UNEXPECTED));
      },
    );
  }
}
