import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/core/shared_preferences/entry_prefs.dart';
import 'package:pharmalink/core/theme/colors.dart';

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