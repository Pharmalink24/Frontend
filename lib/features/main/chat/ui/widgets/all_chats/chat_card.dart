import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/main/chat/data/models/chat.dart';
import 'package:pharmalink/resources/resources.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;
  const ChatCard(
    this.chat, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object>? image = NetworkImage(
      chat.doctorImage ?? '',
    );
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      elevation: 3.0,
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          // Todo; Replace: ? "${ApiConstants.baseUrl}${chat.doctorImage}"
          backgroundImage: chat.doctorImage != null
              ? image
              : const AssetImage(Placeholders.malePlaceholder),

          radius: 24.0,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Dr.",
                  style: AppTextStyle.titleMedium(context).copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                Text(
                  " ${chat.doctorFname} ",
                  style: AppTextStyle.titleMedium(context).copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  chat.doctorLname,
                  style: AppTextStyle.titleMedium(context).copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            Text(
              chat.lastMessageDateTime,
              style: AppTextStyle.labelSmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),
        subtitle: Text(chat.lastMessage),
        onTap: () {
          context.pushNamed(
            Routes.messagesScreen,
            argument: chat,
          );
        },
      ),
    );
  }
}
