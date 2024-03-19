// Flutter Packages
import 'package:flutter/material.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';
import 'package:pharmalink/utilities/info.dart';
import 'package:pharmalink/utilities/routes.dart';
// Packages
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: AppTheme.generalAppTheme,
      initialRoute: initialRoute,
      routes: routes,
    );
  }
}
