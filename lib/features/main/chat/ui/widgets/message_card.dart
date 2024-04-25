import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/main/chat/data/models/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard(
    this.message, {
    super.key,
  });

  bool isMeSender() {
    Logger().i(AuthSharedPrefs.getUserId());
    Logger().i(message.senderUserId);
    return message.senderUserId == AuthSharedPrefs.getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      margin: isMeSender()
          ? const EdgeInsetsDirectional.only(start: 64, end: 0, top: 16)
          : const EdgeInsetsDirectional.only(start: 0, end: 64, top: 16),
      decoration: BoxDecoration(
        color: AppColors.alternateBackground,
        borderRadius: isMeSender()
            ? const BorderRadiusDirectional.only(
                topStart: Radius.circular(16),
                topEnd: Radius.circular(16),
                bottomStart: Radius.circular(16),
              )
            : const BorderRadiusDirectional.only(
                topStart: Radius.circular(16),
                topEnd: Radius.circular(16),
                bottomEnd: Radius.circular(16),
              ),
        border: Border.all(
          color: AppColors.secondary.withOpacity(0.3),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            flex: 5,
            child: Text(
              message.message ?? "",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              message.timestamp.date,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.secondaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
