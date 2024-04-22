import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: 90,
        height: 40,
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
              AppColors.primary,
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            elevation: const MaterialStatePropertyAll(5.0),
          ),
          child: Text(
            'Log Out',
            style: AppTextStyle.labelMedium.copyWith(
              color: AppColors.primaryText,
            ),
          ),
        ),
      ),
    );
  }
}
