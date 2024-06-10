import "package:flutter/material.dart";
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class FormButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Color? color;
  final double? elevation;
  final double? borderRadius;
  final bool hideKeyboardWhenClicked;
  final double? width;
  final double? height;
  final Color? textColor;
  final double fontSize;

  const FormButton({
    super.key,
    this.text = "",
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 24.0),
    this.color,
    this.elevation,
    this.borderRadius,
    this.hideKeyboardWhenClicked = true,
    this.width = double.infinity,
    this.height = 50.0,
    this.textColor,
    this.fontSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: width,
        height: height,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor:
                color != null ? WidgetStatePropertyAll(color) : null,
            elevation: WidgetStatePropertyAll(elevation),
            shape: borderRadius != null
                ? WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                    ),
                  )
                : null,
          ),
          onPressed: () {
            if (hideKeyboardWhenClicked) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
            onPressed();
          },
          child: Text(
            text,
            style: AppTextStyle.titleMedium(context).copyWith(
              color: textColor ?? context.colorScheme.primaryContainer,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
