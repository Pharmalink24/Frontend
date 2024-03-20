// Flutter Packages
import 'package:flutter/material.dart';
// Utilities
import 'package:pharmalink/utilities/constants/constants.dart';
import 'package:pharmalink/utilities/constants/app_info.dart';
import 'package:pharmalink/utilities/routes.dart';
// Packages
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(PharmalinkApp());

class PharmalinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: AppTheme.generalAppTheme,
      initialRoute: initialRoute,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
