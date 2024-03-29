import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  const ProfileButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
            ),
            backgroundColor:
                const MaterialStatePropertyAll(AppColors.primaryBackground),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            elevation: MaterialStatePropertyAll(5.0),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: AppTextStyle.labelMedium,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.secondaryText,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
