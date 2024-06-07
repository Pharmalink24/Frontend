import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/Blocs/connection/network_cubit.dart';
import 'package:pharmalink/core/Blocs/locale/locale_cubit.dart';
import 'package:pharmalink/core/Blocs/theme/theme_cubit.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/helpers/constants/strings.dart';
import 'package:pharmalink/core/localization/app_localizations_setup.dart';
import 'package:pharmalink/core/theme/app_theme.dart';
import 'package:pharmalink/features/main/chat/logic/cubit/chat_cubit.dart';
import 'core/Blocs/connection/network_event.dart';
import 'core/routes/app_router.dart';
import 'features/access/auth/logic/cubit/auth_cubit.dart';
import 'package:device_preview/device_preview.dart';

final appRouter = AppRouter();

class PharmalinkApp extends StatelessWidget {
  final bool isReleaseMode;
  const PharmalinkApp({
    super.key,
    this.isReleaseMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NetworkBloc()..add(ListenConnection()),
        ),
        BlocProvider(
          create: (context) => getIt<LocaleCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ThemeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AuthCubit>()..checkAuthentication(),
        ),
        BlocProvider(
          create: (context) => getIt<ChatCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final localeState = context.watch<LocaleCubit>().state;
          final themeState = context.watch<ThemeCubit>().state;
          return MaterialApp.router(
            builder: !isReleaseMode ? DevicePreview.appBuilder : null,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            locale: !isReleaseMode
                ? DevicePreview.locale(context)
                : localeState.locale,
            title: appTitle,
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: themeState,
            routerConfig: appRouter.config(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
