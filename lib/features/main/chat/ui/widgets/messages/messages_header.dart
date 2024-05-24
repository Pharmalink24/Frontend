import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/theme/styles.dart';
import '../../../../../../core/networking/api_constants.dart';
import '../../../../../../core/widgets/loading/loading_indicator.dart';
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

  Widget _buildAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        width: 50,
        height: 50,
        child: CachedNetworkImage(
          width: 50,
          height: 50,
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
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAvatar(),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${chat.fname} ${chat.lname}'.crop(14),
              style: AppTextStyle.titleMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            Text(
              '@${chat.username}',
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
