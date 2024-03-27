import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/networking/dio_factory.dart';
import 'package:pharmalink/features/access/auth/logic/cubit/auth_cubit.dart';
import 'package:pharmalink/features/access/signin/data/repo/auth_repo.dart';
import 'package:pharmalink/features/access/signin/data/repo/signin_repo.dart';
import 'package:pharmalink/features/access/signin/logic/cubit/signin_cubit.dart';
import 'package:pharmalink/features/access/signup/logic/cubit/signup_cubit.dart';
import 'package:pharmalink/features/access/signup/data/repo/signup_repo.dart';
import 'package:pharmalink/features/access/verification/data/repo/verification_repo.dart';
import 'package:pharmalink/features/access/verification/logic/cubit/verification_cubit.dart';

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

  // Logger
  getIt.registerLazySingleton<Logger>(() => Logger());
}
