import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/networking/dio_factory.dart';
import 'package:pharmalink/features/auth/signin/data/repo/signin_repo.dart';
import 'package:pharmalink/features/auth/signin/logic/cubit/signin_cubit.dart';
import 'package:pharmalink/features/auth/signup/data/logic/cubit/signup_cubit.dart';
import 'package:pharmalink/features/auth/signup/data/repo/signup_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Signin
  getIt.registerLazySingleton<SigninRepo>(() => SigninRepo(getIt()));
  getIt.registerFactory<SigninCubit>(() => SigninCubit(getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
