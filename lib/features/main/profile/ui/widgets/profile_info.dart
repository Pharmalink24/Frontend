import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/card_container.dart';

String name = 'Youssef Osama';
String email = 'youssefosama@google.com';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      title: 'Profile',
      textStyle: AppTextStyle.displaySmall,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
      margin: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyle.headlineSmall,
                    ),
                    Text(
                      email,
                      style: AppTextStyle.bodySmall.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.secondaryBackground,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 4.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Switch to Dark Mode',
                  style: AppTextStyle.bodyMedium,
                ),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                  // trackColor: const MaterialStatePropertyAll(
                  //   AppColors.primaryBackground,
                  // ),
                  // trackOutlineColor:
                  //     MaterialStatePropertyAll(AppColors.primary),
                  // thumbColor:
                  //     const MaterialStatePropertyAll(AppColors.secondary),
                  // overlayColor:
                  //     const MaterialStatePropertyAll(AppColors.secondary),
                  activeTrackColor: AppColors.secondary,
                  activeColor: AppColors.primaryBackground,
                  inactiveTrackColor: AppColors.primaryBackground,
                  inactiveThumbColor: AppColors.tertiary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
