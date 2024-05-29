import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../core/shared_preferences/auth_prefs.dart';
import '../../../../core/shared_preferences/entry_prefs.dart';

class DirectTo extends StatefulWidget {
  const DirectTo({super.key});

  @override
  State<DirectTo> createState() => _DirectToState();
}

class _DirectToState extends State<DirectTo> {
  bool _isFirstEntry = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();

    // Load preferences after the frame is rendered
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _loadPreferences().then((_) {
              direct(context);
            }));
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
    // Add pushReplacementNamed to avoid back navigation
    _isLoggedIn
        ? context.pushRoute(const MainRoute())
        : _isFirstEntry
            ? context.pushRoute(const OnBoardingRoute())
            : context.pushRoute(const SignRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: LinearProgressIndicator(
        color: context.colorScheme.secondary,
      ),
    );
  }
}
