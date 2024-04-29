// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pharmalink/core/Blocs/cubit/locale_cubit.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/helpers/constants/strings.dart';
import 'package:pharmalink/core/localization/app_localizations_setup.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/app_theme.dart';

class PharmalinkApp extends StatelessWidget {
  final AppRouter appRouter;

  const PharmalinkApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocaleCubit>(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (_, localeState) {
          return MaterialApp(
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            // Each time a new state emitted, the app will be rebuilt with the new
            // locale.
            locale: localeState.locale, title: appTitle,
            theme: AppTheme.generalTheme,
            initialRoute: Routes.initialRoute,
            onGenerateRoute: appRouter.generateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
