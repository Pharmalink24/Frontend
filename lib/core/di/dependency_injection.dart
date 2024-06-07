import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/notifications/firebase_notifications.dart';
import 'package:pharmalink/features/app/chat/presentation/logic/chat_cubit.dart';
import '../../features/access/forget_password/data/repo/forget_password_repo.dart';
import '../../features/access/forget_password/logic/forget_password_cubit.dart';
import '../../features/app/doctors/data/repositories/doctors_repo.dart';
import '../../features/app/doctors/presentation/logic/doctors_cubit.dart';
import '../../features/app/drug_interaction/data/repositories/drug_interaction_repo.dart';
import '../../features/app/drug_interaction/presentation/logic/drug_interaction_cubit.dart';
import '../../features/app/prescription/data/repositories/prescription_repo.dart';
import '../../features/app/prescription/presentation/logic/prescription_cubit.dart';
import '../../features/app/profile/data/repositories/profile_repo.dart';
import '../../features/app/profile/presentation/logic/profile_cubit.dart';
import '../../features/app/reminders/presentation/logic/reminders_cubit.dart';
import '../../features/app/reminders/data/repositories/reminders_repo.dart';
import '../../features/app/settings/edit_profile/data/repositories/edit_profile_repo.dart';
import '../../features/app/settings/edit_profile/presentation/logic/edit_profile_cubit.dart';
import '../../features/app/settings/change_password/data/repositories/change_password_repo.dart';
import '../../features/app/settings/change_password/presentation/logic/change_password_cubit.dart';
import '../../shared/presentation/logic/connection/network_cubit.dart';
import '../../shared/presentation/logic/locale/locale_cubit.dart';
import '../../shared/presentation/logic/theme/theme_cubit.dart';
import 'package:pharmalink/features/app/chat/data/repositories/chat_repo.dart';
import '../../shared/data/data_sources/remote/api/api_service.dart';
import '../../shared/data/data_sources/remote/api/app_dio_factory.dart';
import '../../features/access/auth/logic/cubit/auth_cubit.dart';
import '../../features/access/auth/data/repo/auth_repo.dart';
import '../../features/access/sign/data/repo/signin_repo.dart';
import '../../features/access/sign/logic/signin_cubit/signin_cubit.dart';
import '../../features/access/sign/logic/signup_cubit/signup_cubit.dart';
import '../../features/access/sign/data/repo/signup_repo.dart';
import '../../features/access/verification/data/repo/verification_repo.dart';
import '../../features/access/verification/logic/cubit/verification_cubit.dart';
import '../../shared/data/data_sources/remote/socket/socket_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {

  //-------------------- CORE --------------------//

  // Network
  getIt.registerLazySingleton<NetworkBloc>(() => NetworkBloc());

  // Localization
  getIt.registerLazySingleton<LocaleCubit>(() => LocaleCubit());

  // Theme
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

  // Logger
  getIt.registerLazySingleton<Logger>(() => Logger());

  //-------------------- Networking --------------------//

  // Api Dio & Api Service
  Dio appDio = AppDioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(appDio));

  // Socket
  getIt.registerLazySingleton<SocketService>(() => SocketService());

  //-------------------- Notifications --------------------//

  // Firebase Messaging
  getIt.registerLazySingleton<FirebaseNotifications>(() => FirebaseNotifications(getIt()));

  //-------------------- AUTHENTICATION --------------------//

  // Auth
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));

  // Authorization
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

  // Forgot Password
  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(getIt()));
  getIt
      .registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));

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

  //-------------------- Chat --------------------//

  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(getIt(), getIt()));
  getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt()));
}
