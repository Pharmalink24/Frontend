import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/main/chat/data/models/chat.dart';
import 'package:pharmalink/resources/resources.dart';

import '../../../../../../core/networking/api/api_constants.dart';
import '../../../../../../core/widgets/loading/loading_indicator.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;
  const ChatCard(
    this.chat, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      elevation: 3.0,
      color: context.colorScheme.primaryContainer,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            width: 65,
            height: 65,
            child: CachedNetworkImage(
              width: 65,
              height: 65,
              imageUrl: "${ApiConstants.httpsDomain}${chat.image}",
              fit: BoxFit.contain,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  LoadingIndicator(loadingProgress: downloadProgress),
              errorWidget: (context, url, error) => SvgPicture.asset(
                Placeholders.malePlaceholder,
                width: 65,
                height: 65,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Dr. ",
                  style: AppTextStyle.titleMedium(context).copyWith(
                    color: context.colorScheme.onPrimary,
                  ),
                ),
                Text(
                  '${chat.fname} ',
                  style: AppTextStyle.titleMedium(context).copyWith(
                    color: context.colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${chat.lname}'.crop(4),
                  style: AppTextStyle.titleMedium(context).copyWith(
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            Text(
              DateTime.parse(
                      chat.lastMessageDateTime ?? DateTime.now().toString())
                  .format('MM/dd'),
              style: AppTextStyle.labelSmall(context).copyWith(
                color: context.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
        subtitle: Text(
          chat.lastMessage?.crop(24) ?? 'No messages yet',
          style: AppTextStyle.bodySmall(context).copyWith(
            color: context.colorScheme.onSecondary,
          ),
        ),
        onTap: () => context.pushRoute(MessagesRoute(chat: chat)),
      ),
    );
  }
}
