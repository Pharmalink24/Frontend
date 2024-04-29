import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/access/auth/logic/cubit/auth_cubit.dart';
import 'package:pharmalink/generated/l10n.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 40,
        child: TextButton(
          onPressed: () {
            // Popup confirmation dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  S.of(context).signOut,
                  style: AppTextStyle.headlineSmall,
                ),
                content: Text(
                  S.of(context).confirmSignOut,
                  style: AppTextStyle.bodyLarge.copyWith(fontSize: 20.0),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
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
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          S.of(context).cancel,
                          style: AppTextStyle.titleSmall.copyWith(
                            color: AppColors.primaryText,
                          ),
                        ),
                      ),
                      // Todo: Implement log out with AuthCubit
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                            AppColors.secondary,
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          elevation: const MaterialStatePropertyAll(5.0),
                        ),
                        onPressed: () async {
                          // Close dialog
                          Navigator.of(context).pop();
                          // Log out
                          AuthSharedPrefs
                              .clearAuthData(); // Navigate to sign in screen
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.signInScreen);
                        },
                        child: Text(
                          S.of(context).signOut,
                          style: AppTextStyle.titleSmall,
                        ),
                      ),
                    ],
                  )
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
            S.of(context).signOut,
            style: AppTextStyle.labelMedium.copyWith(
              color: AppColors.primaryText,
            ),
          ),
        ),
      ),
    );
  }
}
