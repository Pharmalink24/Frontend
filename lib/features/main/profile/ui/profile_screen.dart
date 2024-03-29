// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'widgets/account_settings.dart';
import 'widgets/profile_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void getCurrentUser() {}

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileInfo(),
            AccountSettings(),
          ],
        ),
      ),
    );
  }
}
