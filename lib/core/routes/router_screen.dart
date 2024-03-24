import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouterScreen extends StatefulWidget {
  const RouterScreen({super.key});

  @override
  State<RouterScreen> createState() => _RouterScreenState();
}

class _RouterScreenState extends State<RouterScreen> {
  bool? _firstTime;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() async {
    super.initState();
    final SharedPreferences prefs = await _prefs;
    _firstTime = prefs.getBool('first-time') ?? true;
    prefs.setBool('first-time', false);

    _firstTime == true
        ? context.pushNamed(Routes.onBoardingScreen)
        : context.pushNamed(Routes.signInScreen);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
