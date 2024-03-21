// Flutter Packages
import 'package:flutter/material.dart';
// Utilities
import 'package:pharmalink/utilities/constants/app_theme.dart';
import 'package:pharmalink/utilities/constants/strings.dart';
import 'package:pharmalink/utilities/app_router.dart';
// Packages
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(PharmalinkApp(
      appRouter: AppRouter(),
    ));

class PharmalinkApp extends StatelessWidget {
  final AppRouter appRouter;
  const PharmalinkApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: AppTheme.generalAppTheme,
      initialRoute: initialRoute,
      // routes: routes,
      onGenerateRoute: AppRouter().generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
