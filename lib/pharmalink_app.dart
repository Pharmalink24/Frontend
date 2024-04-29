// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pharmalink/core/helpers/constants/strings.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/app_theme.dart';

import 'generated/l10n.dart';

class PharmalinkApp extends StatelessWidget {
  final AppRouter appRouter;

  const PharmalinkApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,


      title: appTitle,
      theme: AppTheme.generalTheme,
      
      initialRoute: Routes.initialRoute,
      onGenerateRoute: appRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
