import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/core/shared_preferences/entry_prefs.dart';
import 'package:pharmalink/core/theme/colors.dart';

class AuthListener extends StatefulWidget {
  const AuthListener({super.key});

  @override
  State<AuthListener> createState() => _AuthListenerState();
}

class _AuthListenerState extends State<AuthListener> {
  bool _isFirstEntry = true;
  bool _isLoggedIn = false;
  String? _token;

  @override
  void initState() {
    super.initState();

    // Load Preferences
    _loadPreferences().then((_) {
      direct(context);
    });
  }

  // load Preferences to memory
  Future<void> _loadPreferences() async {
    // Is logged in ?
    _isLoggedIn = AuthSharedPrefs.isUserLoggedIn();

    // Is this first entry ?
    _isFirstEntry = EntrySharedPrefs.isFirstEntry();
    EntrySharedPrefs.storeEntryData(false);
  }

  void direct(BuildContext context) {
    _isFirstEntry
        ? _isLoggedIn
            ? context.pushNamed(Routes.mainScreen)
            : context.pushNamed(Routes.onBoardingScreen)
        : _isLoggedIn
            ? context.pushNamed(Routes.mainScreen)
            : context.pushNamed(Routes.signInScreen);
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32.0),
      child: LinearProgressIndicator(
        color: AppColors.secondary,
      ),
    );
  }
}
