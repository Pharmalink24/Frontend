import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/errors.dart';
import '../../data/repo/profile_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  // Get user profile
  void getUserProfile() async {
    emit(const ProfileState.loading());

    final response = await _profileRepo.getUserInformation();
    response.when(
      success: (user) {
        emit(ProfileState.success(user));
      },
      failure: (error) {
        emit(ProfileState.error(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED));
      },
    );
  }
}
