
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';

import 'presentation/logic/connection/network_cubit.dart';
import 'presentation/logic/locale/locale_cubit.dart';
import 'presentation/logic/theme/theme_cubit.dart';
import 'data/data_sources/remote/api/api_service.dart';
import 'data/data_sources/remote/api/app_dio_factory.dart';
import 'data/data_sources/remote/socket/socket_service.dart';
import '../core/notifications/firebase_notifications.dart';

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
}
