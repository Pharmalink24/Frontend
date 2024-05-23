import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/gradient.dart';
import 'package:pharmalink/core/theme/styles.dart';

class ChatsHeader extends StatelessWidget {
  const ChatsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 16.0,
        end: 8.0,
        top: 8.0,
        bottom: 4.0,
      ),
      decoration: BoxDecoration(
        gradient: AppGradients.secondary(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chats',
                style: AppTextStyle.headlineLarge(context).copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Text(
                'Below are your chats with doctors',
                style: AppTextStyle.bodyMedium(context).copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon:  Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon:  Icon(
                  Icons.more_vert,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
