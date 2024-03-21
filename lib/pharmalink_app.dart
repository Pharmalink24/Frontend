// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/routes/routes.dart';
// Utilities
import 'package:pharmalink/core/theme/app_theme.dart';
import 'package:pharmalink/core/helpers/constants/strings.dart';
import 'package:pharmalink/core/routes/app_router.dart';

class PharmalinkApp extends StatelessWidget {
  final AppRouter appRouter;
  const PharmalinkApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: AppTheme.generalTheme,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: AppRouter().generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
