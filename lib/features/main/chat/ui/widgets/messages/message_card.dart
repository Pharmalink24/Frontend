import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/core/theme/shadow.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/main/chat/data/models/message.dart';

class MessageCard extends StatelessWidget {
  final Message? message;
  final bool isErrorMessage;
  const MessageCard(
    this.message, {
    super.key,
    this.isErrorMessage = false,
  });

  bool isMeSender() {
    if (message == null) {
      Logger().e('Message is null');
      return false;
    } else {
      return message?.senderUserId == AuthSharedPrefs.getUserId();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      margin: isMeSender()
          ? const EdgeInsetsDirectional.only(start: 64, end: 0, top: 16)
          : const EdgeInsetsDirectional.only(start: 0, end: 64, top: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
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
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        boxShadow: AppShadows.box(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            flex: 3,
            child: Text(
              isErrorMessage ? "Error sending message" : message!.message ?? "",
              style: AppTextStyle.bodyMedium(context),
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              isErrorMessage ? "" : message?.timestamp?.date ?? '',
              style: AppTextStyle.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
