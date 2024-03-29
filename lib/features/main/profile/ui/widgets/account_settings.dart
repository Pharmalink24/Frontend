import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/main/profile/ui/widgets/profile_button.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 8.0),
      child: Container(
        color: AppColors.secondaryBackground,
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'Account Settings',
                    style: AppTextStyle.labelMedium,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const ProfileButton(text: 'Change Password'),
                const ProfileButton(text: 'Edit Profile'),
                const ProfileButton(text: 'Settings'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 90,
                    height: 40,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          AppColors.primaryBackground,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        elevation: const MaterialStatePropertyAll(5.0),
                      ),
                      child: const Text(
                        'Log Out',
                        style: AppTextStyle.labelMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
