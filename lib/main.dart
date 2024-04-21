import 'package:flutter/material.dart';
import 'pharmalink_app.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'init.dart';

void main() async {
  await init();
  runApp(
    PharmalinkApp(
      appRouter: AppRouter(),
    ),
  );
}
