import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/styles.dart';
import '../../../../../../resources/resources.dart';
import '../../../data/models/chat.dart';

AppBar buildMessageAppBar(BuildContext context, Chat chat) {
  return AppBar(
    toolbarHeight: 65.0,
    elevation: 2,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    ),
    title: MessagesHeader(chat),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.more_horiz,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    ],
  );
}

class MessagesHeader extends StatelessWidget {
  final Chat chat;
  const MessagesHeader(this.chat, {super.key});

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object>? image = NetworkImage(
      chat.doctorImage ?? '',
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          // Todo; Replace: ? "${ApiConstants.baseUrl}${chat.doctorImage}"
          backgroundImage: chat.doctorImage != null
              ? image
              : const AssetImage(Placeholders.malePlaceholder),

          radius: 24.0,
        ),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  chat.doctorFname,
                  style: AppTextStyle.headlineSmall(context).copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(width: 4.0),
                Text(
                  chat.doctorLname,
                  style: AppTextStyle.headlineSmall(context).copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            Text(
              '@${chat.doctorUsername}',
              style: AppTextStyle.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
