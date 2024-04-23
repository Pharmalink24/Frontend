import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/features/main/doctors/data/repo/doctors_repo.dart';
import 'package:pharmalink/features/main/doctors/logic/cubit/doctors_cubit.dart';
import 'package:pharmalink/features/main/drug_interaction/data/repo/drug_interaction_repo.dart';
import 'package:pharmalink/features/main/drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import 'package:pharmalink/features/main/home/data/repo/home_page_repo.dart';
import 'package:pharmalink/features/main/home/logic/cubit/home_page_cubit.dart';
import 'package:pharmalink/features/main/profile/data/repo/profile_repo.dart';
import 'package:pharmalink/features/main/profile/logic/cubit/profile_cubit.dart';
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

  // Home Page
  getIt.registerLazySingleton<HomePageRepo>(() => HomePageRepo(getIt()));
  getIt.registerFactory<HomePageCubit>(() => HomePageCubit(getIt()));

  // Drug Interaction
  getIt.registerLazySingleton<DrugInteractionRepo>(
      () => DrugInteractionRepo(getIt()));
  getIt.registerFactory<DrugInteractionCubit>(
      () => DrugInteractionCubit(getIt()));

  // Profile Information
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));

  // Doctors 
  getIt.registerLazySingleton<DoctorsRepo>(() => DoctorsRepo(getIt()));
  getIt.registerFactory<DoctorsCubit>(() => DoctorsCubit(getIt()));

  // Logger
  getIt.registerLazySingleton<Logger>(() => Logger());
}
