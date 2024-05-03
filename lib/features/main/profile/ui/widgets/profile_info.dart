import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/constants/paths.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/card_container_with_title.dart';
import 'package:pharmalink/core/models/user.dart';
import 'dark_mode_switch.dart';

const String kPlaceholderImage = '${AppPaths.images}/user_placeholder.jpg';

class ProfileInfo extends StatefulWidget {
  final User user;
  const ProfileInfo({
    super.key,
    required this.user,
  });

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  String cropperName(String name, {int length = 5}) {
    return name.length > length ? '${name.substring(0, length - 1)}..' : name;
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object>? image = NetworkImage(
      '${ApiConstants.baseUrl}${widget.user.image}',
    );

    Widget _buildUserInfo() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: widget.user.image != null
                  ? image
                  : const AssetImage(kPlaceholderImage),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cropperName("${widget.user.fname} ${widget.user.lname}",
                      length: 14),
                  style: AppTextStyle.headlineSmall(context),
                ),
                Text(
                  cropperName(widget.user.email!, length: 30),
                  style: AppTextStyle.bodySmall(context).copyWith(
                    color: AppColors.primary, // !! Change to primary
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return CardContainerWithTitle(
      title: AppLocalizations.of(context).translate('profile'),
      flex: 4,
      textStyle: AppTextStyle.displaySmall(context),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      margin: const EdgeInsets.all(0.0),
      isScrollable: false,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: _buildUserInfo(),
          ),
          const Divider(color: AppColors.secondaryBackground),
          const Expanded(
            flex: 2,
            child: DarkModeSwitch(),
          ),
        ],
      ),
    );
  }
}
