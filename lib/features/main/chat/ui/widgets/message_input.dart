import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmalink/core/theme/colors.dart';

class MessageInput extends StatelessWidget {
  final void Function()? onPressed;
  final TextEditingController? controller;

  const MessageInput({
    super.key,
    this.onPressed,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 0, bottom: 16),
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      decoration: BoxDecoration(
        color: AppColors.alternateBackground,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: AppColors.accent5.withOpacity(0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Type a message...',
                border: InputBorder.none,
              ),
              controller: controller,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.send,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
