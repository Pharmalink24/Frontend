import 'package:flutter/material.dart';
import '../../../../../core/theme/styles.dart';

class AccountSettingsButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const AccountSettingsButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.25,
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: AppTextStyle.bodyMedium(context),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.onSecondary,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
