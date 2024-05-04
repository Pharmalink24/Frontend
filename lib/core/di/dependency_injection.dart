import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import '../../features/main/doctors/data/repo/doctors_repo.dart';
import '../../features/main/doctors/logic/cubit/doctors_cubit.dart';
import '../../features/main/drug_interaction/data/repo/drug_interaction_repo.dart';
import '../../features/main/drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import '../../features/main/prescription/data/repo/prescription_repo.dart';
import '../../features/main/prescription/logic/cubit/prescription_cubit.dart';
import '../../features/main/profile/data/repo/profile_repo.dart';
import '../../features/main/profile/logic/cubit/profile_cubit.dart';
import '../../features/main/reminders/logic/cubit/reminders_cubit.dart';
import '../../features/main/reminders/repo/reminders_repo.dart';
import '../../features/main/settings/edit_profile/data/repo/edit_profile_repo.dart';
import '../../features/main/settings/edit_profile/logic/cubit/edit_profile_cubit.dart';
import '../../features/main/settings/change_password/data/repo/change_password_repo.dart';
import '../../features/main/settings/change_password/logic/cubit/change_password_cubit.dart';
import '../Blocs/locale/locale_cubit.dart';
import '../Blocs/theme/theme_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
import '../../features/access/auth/logic/cubit/auth_cubit.dart';
import '../../features/access/auth/data/repo/auth_repo.dart';
import '../../features/access/signin/data/repo/signin_repo.dart';
import '../../features/access/signin/logic/cubit/signin_cubit.dart';
import '../../features/access/signup/logic/cubit/signup_cubit.dart';
import '../../features/access/signup/data/repo/signup_repo.dart';
import '../../features/access/verification/data/repo/verification_repo.dart';
import '../../features/access/verification/logic/cubit/verification_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //-------------------- AUTHENTICATION --------------------//

  // Auth
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));

  // Signin
  getIt.registerLazySingleton<SigninRepo>(() => SigninRepo(getIt()));
  getIt.registerFactory<SigninCubit>(() => SigninCubit(getIt(), getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // Verify
  getIt
      .registerLazySingleton<VerificationRepo>(() => VerificationRepo(getIt()));
  getIt.registerFactory<VerificationCubit>(() => VerificationCubit(getIt()));

  //-------------------- MAIN --------------------//

  // Home Page
  getIt.registerLazySingleton<RemindersRepo>(() => RemindersRepo(getIt()));
  getIt.registerFactory<RemindersCubit>(() => RemindersCubit(getIt()));

  //-------------------- INTERACTION --------------------//
  // Drug Interaction
  getIt.registerLazySingleton<DrugInteractionRepo>(
      () => DrugInteractionRepo(getIt()));
  getIt.registerFactory<DrugInteractionCubit>(
      () => DrugInteractionCubit(getIt()));

  //-------------------- SETTINGS & PROFILE --------------------//
  // Profile Information
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));

  // Edit Profile
  getIt.registerLazySingleton<EditProfileRepo>(() => EditProfileRepo(getIt()));
  getIt.registerFactory<EditProfileCubit>(() => EditProfileCubit(getIt()));

  // Change Password
  getIt.registerLazySingleton<ChangePasswordRepo>(
      () => ChangePasswordRepo(getIt()));
  getIt
      .registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(getIt()));

  //-------------------- DOCTORS --------------------//
  // Doctors
  getIt.registerLazySingleton<DoctorsRepo>(() => DoctorsRepo(getIt()));
  getIt.registerFactory<DoctorsCubit>(() => DoctorsCubit(getIt()));

  //-------------------- PRESCRIPTION --------------------//
  getIt
      .registerLazySingleton<PrescriptionRepo>(() => PrescriptionRepo(getIt()));
  getIt.registerFactory<PrescriptionCubit>(() => PrescriptionCubit(getIt()));

  //-------------------- CORE --------------------//

  // Localization
  getIt.registerLazySingleton<LocaleCubit>(() => LocaleCubit());

  // Theme
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

  // Logger
  getIt.registerLazySingleton<Logger>(() => Logger());
}
