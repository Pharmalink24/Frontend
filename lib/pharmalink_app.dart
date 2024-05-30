// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/Blocs/connection/bloc/network_cubit.dart';
import 'package:pharmalink/core/Blocs/locale/locale_cubit.dart';
import 'package:pharmalink/core/Blocs/theme/theme_cubit.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/helpers/constants/strings.dart';
import 'package:pharmalink/core/localization/app_localizations_setup.dart';
import 'package:pharmalink/core/theme/app_theme.dart';
import 'package:pharmalink/features/main/chat/logic/cubit/chat_cubit.dart';

import 'core/Blocs/connection/bloc/network_event.dart';
import 'core/routes/app_router.dart';
import 'features/access/auth/logic/cubit/auth_cubit.dart';

class PharmalinkApp extends StatelessWidget {
  PharmalinkApp({super.key});

  final _appRouter = AppRouter();

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
          create: (context) => getIt<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ChatCubit>(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (context, localeState) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            buildWhen: (previousState, currentState) =>
                previousState != currentState,
            builder: (context, themeState) {
              return MaterialApp.router(
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                locale: localeState.locale,
                title: appTitle,
                theme: AppTheme.lightTheme(),
                darkTheme: AppTheme.darkTheme(),
                themeMode: themeState,
                routerConfig: _appRouter.config(),
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
