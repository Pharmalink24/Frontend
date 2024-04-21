// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/core/shared_preferences/shared_preferences_service.dart';
import 'package:pharmalink/features/access/signin/data/models/signin_response.dart';
import 'pharmalink_app.dart';
import 'package:pharmalink/core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Required for async calls in `main`
  setupGetIt(); // Initialize get it
  await SharedPrefsService.init(); // Initialize PreferenceUtils instance.

  AuthSharedPrefs.storeAuthData(
    SigninResponse(
        id: 1,
        username: "username",
        email: "email",
        accessToken:
            "PatientCustomToken eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzEzNzIyNDQyLCJpYXQiOjE3MTM3MjA2NDIsImp0aSI6ImU2Yjc5Zjg4YjJkMjQyOTZiMjk3MTE5NWQ3NDYxODRhIiwidXNlcl9pZCI6OX0.N6IHfOhpQzmyT_n-zfmH3m1W1XaCGMsVAWGiFNncBGA"),
  );
  runApp(
    PharmalinkApp(
      appRouter: AppRouter(),
    ),
  );
}
