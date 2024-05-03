// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/Blocs/locale/locale_cubit.dart';
import 'package:pharmalink/core/Blocs/theme/theme_cubit.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/helpers/constants/strings.dart';
import 'package:pharmalink/core/localization/app_localizations_setup.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/routes/routes.dart';

class PharmalinkApp extends StatelessWidget {
  final AppRouter appRouter;

  const PharmalinkApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LocaleCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ThemeCubit>(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (context, localeState) {
          return BlocBuilder<ThemeCubit, ThemeData?>(
            builder: (context, themeState) {
              return MaterialApp(
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                locale: localeState.locale,
                title: appTitle,
                themeMode: ThemeMode.system,
                theme: themeState,
                darkTheme: themeState,
                initialRoute: Routes.initialRoute,
                onGenerateRoute: appRouter.generateRoute,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
