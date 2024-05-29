import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/theme/colors.dart';
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_sharp,
              color: context.colorScheme.onPrimary,
            ),
            onPressed: () => context.maybePop(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context).translate('chats'),
                      style: AppTextStyle.headlineLarge(context).copyWith(
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)
                          .translate('chatsDescription'),
                      style: AppTextStyle.bodyMedium(context).copyWith(
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: context.colorScheme.onPrimary,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
