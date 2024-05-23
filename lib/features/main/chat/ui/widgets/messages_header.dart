import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/constants/paths.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

import '../../data/models/chat.dart';

const String kPlaceholderImage = '${AppPaths.images}/user_placeholder.jpg';

AppBar buildMessageAppBar(BuildContext context, Chat chat) {
  return AppBar(
    backgroundColor: AppColors.secondaryBackground,
    elevation: 1,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: AppColors.primaryText,
      ),
    ),
    title: MessagesHeader(chat),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_horiz,
          color: AppColors.primaryText,
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
              : const AssetImage(kPlaceholderImage),

          radius: 24.0,
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  chat.doctorFname,
                  style: AppTextStyle.headlineMedium.copyWith(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  chat.doctorLname,
                  style: AppTextStyle.headlineMedium.copyWith(
                    color: AppColors.primaryText,
                  ),
                ),
              ],
            ),
            Text(
              '@${chat.doctorUsername}',
              style: AppTextStyle.bodyMedium.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
