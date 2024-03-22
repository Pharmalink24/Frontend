// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'pharmalink_app.dart';
import 'package:pharmalink/core/routes/app_router.dart';
// Packages
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  setupGetIt();
  runApp(
    PharmalinkApp(
      appRouter: AppRouter(),
    ),
  );
}
