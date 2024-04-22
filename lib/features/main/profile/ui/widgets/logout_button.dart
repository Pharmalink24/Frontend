import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/access/auth/logic/cubit/auth_cubit.dart';
import 'package:pharmalink/features/access/signin/logic/cubit/signin_cubit.dart';

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
          onPressed: () {
            // Popup confirmation dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Log Out'),
                content: const Text('Are you sure you want to log out?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Close dialog
                      Navigator.of(context).pop();
                      // Log out
                      context.read<AuthCubit>().logout();
                      // Navigate to sign in screen
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.signInScreen);
                    },
                    child: const Text('Log Out'),
                  ),
                ],
              ),
            );
          },
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
